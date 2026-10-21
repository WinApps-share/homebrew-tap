cask "gui-for-singbox" do
  arch arm: "arm64", intel: "amd64"

  version "1.28.1"
  sha256 arm:   "474bd2b7345f5a3d1675581f6fafab61b04b229c421fc11b232e6a15841195fd",
         intel: "58434bf3950510641a974c0b8b23e2eacb0395f8a67aef2a963c56bf8626c546"

  url "https://github.com/GUI-for-Cores/GUI.for.SingBox/releases/download/v#{version}/GUI.for.SingBox-darwin-#{arch}.zip"
  name "GUI for SingBox"
  desc "跨平台的 singbox 图形界面客户端"
  homepage "https://github.com/GUI-for-Cores/GUI.for.SingBox"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "GUI.for.SingBox.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "GUI.for.SingBox.app"],
        base: :appdir
  end

  zap trash: [
    "~/Library/Application Support/GUI.for.SingBox",
    "~/Library/Caches/com.wails.GUI.for.SingBox",
    "~/Library/Preferences/com.wails.GUI.for.SingBox.plist",
    "~/Library/WebKit/com.wails.GUI.for.SingBox",
  ]
end
