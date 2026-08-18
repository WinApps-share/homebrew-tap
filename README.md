# WinApps-share Homebrew Tap

这是 WinApps-share 维护的 Homebrew 自定义软件源（tap），可同时存放命令行工具的 Formula 和 macOS 应用的 Cask。

## 添加软件源与安装

### 直接安装（推荐）

使用完整名称时不需要预先添加 tap，Homebrew 会自动拉取软件源。Homebrew 6 及以上也只会信任本次安装的软件，而不是整个 tap。

```bash
# Formula
brew install WinApps-share/tap/<formula-name>

# Cask
brew install --cask WinApps-share/tap/<cask-name>
```

例如：

```bash
brew install --cask WinApps-share/tap/neat-download-manager
```

### 先添加 tap，再安装

```bash
brew tap WinApps-share/tap
```

为避免名称冲突，也为了兼容 Homebrew 6 的 tap 信任机制，添加 tap 后仍建议使用完整名称：

```bash
brew install WinApps-share/tap/<formula-name>
brew install --cask WinApps-share/tap/<cask-name>
```

如果希望使用短名称，需要先信任具体软件：

```bash
brew trust --formula WinApps-share/tap/<formula-name>
brew trust --cask WinApps-share/tap/<cask-name>

brew install <formula-name>
brew install --cask <cask-name>
```

只有在信任本 tap 中所有当前和未来的软件时，才应信任整个 tap：

```bash
brew trust --tap WinApps-share/tap
```

### 更新、卸载与移除 tap

```bash
# 拉取 tap 更新，并升级已安装软件
brew update
brew upgrade --cask WinApps-share/tap/neat-download-manager

# 卸载软件（--zap 会同时清理 cask 中声明的用户配置）
brew uninstall --cask neat-download-manager
brew uninstall --zap --cask neat-download-manager

# 不再使用此软件源时移除 tap
brew untap WinApps-share/tap
```

## 仓库结构

```text
.
├── Formula/            # Formula：通常从源码构建的命令行工具
├── Casks/              # Cask：预编译的 macOS 应用或安装包
└── .github/workflows/
    ├── audit.yml       # push/PR 时执行审计与格式检查
    └── auto-update.yml # 每 12 小时检查并提交上游版本更新
```

## 本地开发与测试

Homebrew 的审计命令按 tap 名称加载软件，因此最省事的开发方式是直接在 Homebrew 管理的 tap 仓库中修改：

```bash
brew tap WinApps-share/tap
brew trust --tap WinApps-share/tap
cd "$(brew --repository WinApps-share/tap)"
```

如果已经在其他目录克隆了本仓库，并希望直接测试未提交改动，可把当前工作区链接到 Homebrew 的 tap 目录：

```bash
# 若已添加远程 tap，先移除 Homebrew 管理的那份副本
brew untap WinApps-share/tap

tap_parent="$(brew --repository)/Library/Taps/winapps-share"
mkdir -p "$tap_parent"
ln -s "$PWD" "$tap_parent/homebrew-tap"
brew trust --tap WinApps-share/tap
```

测试结束后运行 `brew untap WinApps-share/tap` 即可移除链接，不会删除原工作区。不要只把 `.rb` 文件路径传给 `brew audit`，新版 Homebrew 已禁用这种用法。

### 1. 语法、格式与审计

```bash
# Ruby 语法（快速、离线）
ruby -c Casks/neat-download-manager.rb

# 整个 tap 的格式与严格在线审计
brew style WinApps-share/tap
brew audit --strict --online --tap=WinApps-share/tap
```

新增软件时可对单个条目执行更严格的 `--new` 审计：

```bash
brew audit --new WinApps-share/tap/<formula-name>
brew audit --new --cask WinApps-share/tap/<cask-name>
```

### 2. 检查版本探测与下载文件

```bash
# 检查 livecheck 是否能识别上游版本
brew livecheck --verbose WinApps-share/tap/neat-download-manager

# 只下载并验证 cask 的 SHA256，不安装
brew fetch --cask WinApps-share/tap/neat-download-manager
```

也可以手动核对下载文件的 SHA256：

```bash
curl -L <download-url> | shasum -a 256
```

### 3. 安装测试

```bash
# Formula：强制从源码构建，然后运行 formula 的 test do 测试
brew install --build-from-source WinApps-share/tap/<formula-name>
brew test WinApps-share/tap/<formula-name>

# Cask：先检查安装参数，再实际安装并查看信息
brew install --cask --dry-run WinApps-share/tap/<cask-name>
brew install --cask WinApps-share/tap/<cask-name>
brew info --cask WinApps-share/tap/<cask-name>
```

测试完成后可卸载：

```bash
brew uninstall <formula-name>
brew uninstall --cask <cask-name>
```

## 新增软件

### 新增 Formula

先确保 tap 已添加，然后让 Homebrew 生成骨架：

```bash
brew create https://example.com/foo-1.0.0.tar.gz \
  --tap WinApps-share/tap \
  --set-name winapps-foo
```

随后补全依赖、安装逻辑和 `test do`，再运行上面的语法、审计和安装测试。文件应位于 `Formula/<name>.rb`。

### 新增 Cask

```bash
brew create --cask https://example.com/MyApp-1.0.0.dmg \
  --tap WinApps-share/tap \
  --set-name winapps-my-app
```

文件应位于 `Casks/<token>.rb`。Cask token 必须全局唯一，建议使用 `winapps-` 前缀避免与官方或其他 tap 冲突。对于固定下载地址，应添加可靠的 `livecheck`，否则自动更新无法发现新版本。

## GitHub Actions

### `audit.yml`

每次向 `main` push 或提交 pull request 时运行：

- `brew audit --strict --online --tap="WinApps-share/tap"`
- `brew style "WinApps-share/tap"`

建议在 GitHub 分支保护中把该任务设为合并前必需检查；仅有工作流文件并不会自动阻止失败的 PR 合并。

### `auto-update.yml`

每 12 小时以及手动触发时执行：

1. `brew livecheck` 找出落后于上游的 Formula/Cask；
2. 将探测到的新版本显式传给 `brew bump-cask-pr --write-only` 或 `brew bump-formula-pr --write-only`；
3. 自动计算并写入新 SHA256；
4. 每个软件单独提交，最后推送到 `main`。

该工作流使用仓库内置的 `GITHUB_TOKEN`，仓库的 Actions 设置必须允许该 token 写入 contents。如果 `main` 禁止 GitHub Actions 直接推送，需要为机器人配置相应的分支规则例外，或将流程改为创建 PR。

自动更新会执行 Homebrew 自带的审计，但它不能替代真实安装测试。上游若改变 DMG 内的应用名称、安装结构或系统要求，仍需人工修改 Cask。

## 常见问题

- 找不到 Cask：确认文件位于 `Casks/`（复数）且扩展名为 `.rb`。
- 找不到 Formula：确认文件位于 `Formula/` 且扩展名为 `.rb`。
- `brew audit` 提示不能使用路径：先添加并信任 tap，然后使用完整软件名或 `--tap=WinApps-share/tap`。
- SHA256 不匹配：上游可能替换了固定 URL 对应的文件；重新下载核对，同时确认版本号确实变化。
- tap 没有更新：先运行 `brew update`；仍异常时再执行 `brew untap WinApps-share/tap && brew tap WinApps-share/tap`。
- 名称与官方包冲突：优先使用完整名称，新增软件时使用唯一 token；Formula 必要时可改名或设置 `keg_only`。

## 参考资料

- [Homebrew：How to Create and Maintain a Tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [Homebrew：Tap Trust](https://docs.brew.sh/Tap-Trust)
- [Homebrew：Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Homebrew：Cask Cookbook](https://docs.brew.sh/Cask-Cookbook)
