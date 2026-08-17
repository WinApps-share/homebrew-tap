# 这是一个 Cask 模板：用于安装「打包好的 GUI 应用 / 二进制 app」。
#
# 注意：cask 名称必须全局唯一，建议用 <用户名>-<名字> 前缀，避免与官方/他人冲突。
# 使用方式：复制为 Cask/<user>-<app>.rb 并填写。
#
# 完整参考：
#   https://docs.brew.sh/Cask-Cookbook

cask "ayong-example" do
  version "1.0.0"
  sha256 "应用的 ZIP 或 DMG 的 sha256（64 位十六进制）"

  url "https://example.com/YourApp-#{version}.zip"
  name "YourApp"
  desc "一句话描述这个应用"
  homepage "https://example.com"

  # 打包方式二选一：
  #  - DMG 应用：  app "YourApp.app"
  #  - ZIP 内含 pkg 安装器：
  #    pkg "YourApp-#{version}.pkg"
  #  - 命令行二进制：binary "some/bin/tool"

  app "YourApp.app"

  # 卸载时清理用户配置（可选）：
  # zap trash: [
  #   "~/Library/Application Support/YourApp",
  #   "~/Library/Preferences/com.example.yourapp.plist",
  # ]
end
