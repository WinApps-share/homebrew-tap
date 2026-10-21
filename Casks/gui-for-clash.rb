cask "gui-for-clash" do
  arch arm: "arm64", intel: "amd64"

  version "1.28.1"
  sha256 arm:   "d507e6b2bb93436c3ba8a14b555993ba9802a82a8a70e5f4113aa209074d9b55",
         intel: "6331cee0711862b16de9548640df3d1f593ce61cd821ac99bc2fe56995061600"

  url "https://github.com/GUI-for-Cores/GUI.for.Clash/releases/download/v#{version}/GUI.for.Clash-darwin-#{arch}.zip"
  name "GUI for Clash"
  desc "跨平台的 Clash 图形界面客户端"
  homepage "https://github.com/GUI-for-Cores/GUI.for.Clash"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "GUI.for.Clash.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "GUI.for.Clash.app"],
        base: :appdir
  end

  zap trash: [
    "~/Library/Application Support/GUI.for.Clash",
    "~/Library/Caches/com.wails.GUI.for.Clash",
    "~/Library/Preferences/com.wails.GUI.for.Clash.plist",
    "~/Library/WebKit/com.wails.GUI.for.Clash",
  ]
end
