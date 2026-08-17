# homebrew-tap

我自己维护的 Homebrew 软件源（tap）。

本 tap 同时支持 **Formulae**（命令行工具配方，源码构建）与 **Casks**（打包好的 GUI 应用），两者互不冲突。

## 目录结构

```
.
├── Formula/          # 存放 formula（*.rb），安装 CLI 工具
├── Cask/             # 存放 cask（*.rb），安装打包好的应用（骨架中改名为 Cask/）
├── cmd/              # （可选）自定义 brew 子命令
└── .github/workflows/ # （可选）GitHub Actions 自动构建 bottle / cask 校验
```

> 命名约定：若托管在 GitHub，仓库名建议以 `homebrew-` 开头（如 `homebrew-tap`），这样用户可以用简短的 `brew tap <user>/tap` 命令。

## 如何安装本 tap 里的软件

### 方式一：直接安装（推荐）

用户无需先 `brew tap`，直接安装指定软件即可，Homebrew 会自动把 tap 拉取下来：

```bash
# 安装 formula
brew install <user>/tap/<formula-name>

# 安装 cask
brew install --cask <user>/tap/<cask-name>
```

### 方式二：先 add tap 再安装

```bash
brew tap <user>/tap
# 然后
brew install <formula-name>
brew install --cask <cask-name>
```

## 开发规范

### 新增一个 formula

方法一（推荐，用 `brew create` 自动生成骨架并校验）：

```bash
brew create https://example.com/foo-1.0.0.tar.gz --tap <user>/tap --set-name <user>-foo
```

方法二（手写）：在 `Formula/` 下新建 `<name>.rb`，参照 [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)。

### 新增一个 cask

在 `Cask/` 下新建 `<name>.rb`，参照 [Cask Cookbook](https://docs.brew.sh/Cask-Cookbook) 或 [homebrew/cask](https://github.com/Homebrew/homebrew-cask) 中的示例。

> 注意：**cask 的名称必须全局唯一**，为避免与官方/他人冲突，建议用 `<user>-<name>` 前缀命名，例如 `ayong-myapp`。

### 本地测试

```bash
# 语法 / 质量检查
brew audit --strict --online <formula-or-cask-name>

# 本地安装测试（formula 从源码构建；cask 需 --cask）
brew install --build-from-source <user>/tap/<formula-name>
brew install --cask <user>/tap/<cask-name>
```

### 校验 SHA256

```bash
curl -L <URL> | shasum -a 256
```

### 发布到 GitHub

```bash
brew install gh
gh repo create <user>/homebrew-tap --push --public --source "$(brew --repository <user>/tap)"
```

## 常见问题

- **Formula 找不到**：确认文件在 `Formula/` 子目录且扩展名为 `.rb`。
- **安装失败**：检查 formula/cask 里的 `url` 与 `sha256` 是否正确。
- **tap 不更新**：`brew untap <user>/tap && brew tap <user>/tap` 强制重新克隆。
- **与 core formula 冲突**：改名，或改为 `keg-only`（见 [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook#keg-only)）。

## 参考

- [How to Create and Maintain a Tap — Homebrew 官方文档](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [Taps — 中文文档](https://docs.brew.sh.cn/Taps)
