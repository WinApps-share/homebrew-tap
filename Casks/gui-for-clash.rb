cask "gui-for-clash" do
  arch arm: "arm64", intel: "amd64"

  version "1.29.0"
  sha256 arm:   "f7544ca07f2abd61cd812687d5f33ab544bbf105f6cd1ddd6b6c1edd91c750ab",
         intel: "3e0f96011386cd4abfd0faba27a39ee682583790d6df1fc614888f15088e7d60"

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
