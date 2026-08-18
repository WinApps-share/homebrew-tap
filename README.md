# homebrew-tap

WinApps-share 维护的 Homebrew 软件源（tap）。

本 tap 同时支持 **Formulae**（命令行工具配方，源码构建）与 **Casks**（打包好的 GUI 应用），两者互不冲突。

## 目录结构

```
.
├── Formula/          # 存放 formula（*.rb），安装 CLI 工具
├── Cask/             # 存放 cask（*.rb），安装打包好的应用
├── cmd/              # （可选）自定义 brew 子命令
└── .github/workflows/ # （可选）GitHub Actions 自动构建 bottle / cask 校验
```

> 命名约定：本仓库以 `homebrew-` 开头（`homebrew-tap`），因此用户可以用简短的 `brew tap WinApps-share/tap` 命令。

## 如何安装本 tap 里的软件

### 方式一：直接安装（推荐）

用户无需先 `brew tap`，直接安装指定软件即可，Homebrew 会自动把 tap 拉取下来：

```bash
# 安装 formula
brew install WinApps-share/tap/<formula-name>

# 安装 cask
brew install --cask WinApps-share/tap/<cask-name>
```

### 方式二：先 add tap 再安装

```bash
brew tap WinApps-share/tap
# 然后
brew install <formula-name>
brew install --cask <cask-name>
```

## 开发规范

### 新增一个 formula

方法一（推荐，用 `brew create` 自动生成骨架并校验）：

```bash
brew create https://example.com/foo-1.0.0.tar.gz --tap WinApps-share/tap --set-name WinApps-share-foo
```

方法二（手写）：在 `Formula/` 下新建 `<name>.rb`，参照 [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)。

### 新增一个 cask

在 `Cask/` 下新建 `<name>.rb`，参照 [Cask Cookbook](https://docs.brew.sh/Cask-Cookbook) 或 [homebrew/cask](https://github.com/Homebrew/homebrew-cask) 中的示例。

> 注意：**cask 的名称必须全局唯一**，为避免与官方/他人冲突，建议用 `winapps-<name>` 前缀命名，例如 `winapps-myapp`。

### 本地测试

```bash
# 语法 / 质量检查
brew audit --strict --online <formula-or-cask-name>

# 本地安装测试（formula 从源码构建；cask 需 --cask）
brew install --build-from-source WinApps-share/tap/<formula-name>
brew install --cask WinApps-share/tap/<cask-name>
```

### 校验 SHA256

```bash
curl -L <URL> | shasum -a 256
```

### 发布到 GitHub

```bash
brew install gh
gh repo create WinApps-share/homebrew-tap --push --public --source "$(brew --repository WinApps-share/tap)"
```

## 自动检查与自动更新

本 tap 提供两层自动化：

### 自动检查（audit.yml）

每次 `push` / `pull_request` 都会自动运行 `brew audit` 与 `brew style`，确保 formula / cask 语法与质量没问题。PR 未通过这些检查无法合并。

### 自动更新（auto-update.yml）

通过 Homebrew 官方命令自动检查上游最新版本（类似 Scoop 的 Excavator），并把更新**直接提交到 `main`**：

- 配置在 `.github/workflows/auto-update.yml`，默认**每周一**自动扫描（可手动 `workflow_dispatch` 触发）；
- 遍历 `Cask/*.rb` 用 `brew bump-cask-pr --write-only`、遍历 `Formula/*.rb` 用 `brew bump-formula-pr --write-only` 自动更新 `version`、`url` 与 `sha256`；
- 检测到新版本时，直接在本仓库 `main` 分支提交并推送（无需 PR，无需配置任何 Secret，用内置 `GITHUB_TOKEN` 即可）；
- 若没有任何更新，则不做改动、不产生提交，工作流正常绿灯跳过。

> ⚠️ 注意：自动更新只保证 `version` / `sha256` 与上游对上，**不验证能否真正编译/安装**。对重要软件仍建议提交后人工抽查。此外，「固定下载地址」（URL 不含版本号）的 cask 可能无法被自动探测到新版本，需手动更新。

> 提示：本方案取代了原有的 Renovate（`.github/workflows/renovate.yml` 与 `renovate.json`），那两个文件已移除。

## 常见问题

- **Formula 找不到**：确认文件在 `Formula/` 子目录且扩展名为 `.rb`。
- **安装失败**：检查 formula/cask 里的 `url` 与 `sha256` 是否正确。
- **tap 不更新**：`brew untap WinApps-share/tap && brew tap WinApps-share/tap` 强制重新克隆。
- **与 core formula 冲突**：改名，或改为 `keg-only`（见 [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook#keg-only)）。

## 参考

- [How to Create and Maintain a Tap — Homebrew 官方文档](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [Taps — 中文文档](https://docs.brew.sh.cn/Taps)
