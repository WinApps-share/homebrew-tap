cask "xterminal" do
  arch arm: "arm64", intel: "x64"

  version "5.8.6"
  sha256 arm:   "630d55debb85e3cfaad761056adde87b965b16f02f352e63690acab96e4244d2",
         intel: "5b5c07992e9a22e96715b650e55d1c6d434db58b4c4597877ff87114b053c261"

  url "https://cdn-cn.xterminal.cn/downloads/XTerminal-#{version}-mac-#{arch}.dmg",
      verified: "cdn-cn.xterminal.cn/downloads/"
  name "XTerminal"
  desc "集成系统监控、文件管理等多功能 SSH 工具"
  homepage "https://www.terminal.icu/"

  livecheck do
    url "https://api.xterminal.cn/server/electron/version3"
    strategy :json do |json|
      json.dig("mac", "version")
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "XTerminal.app"

  zap trash: [
    "~/Library/Application Support/xterminal",
    "~/Library/Application Support/xterminal.windows.json",
    "~/Library/Caches/cn.xterminal.www",
    "~/Library/Caches/cn.xterminal.www.ShipIt",
    "~/Library/Caches/xterminal-updater",
    "~/Library/HTTPStorages/cn.xterminal.www",
    "~/Library/Logs/xterminal",
    "~/Library/Preferences/ByHost/cn.xterminal.www.ShipIt.32C71AA3-0CFC-5D9F-8204-620ECACFC378.plist",
    "~/Library/Preferences/cn.xterminal.www.plist",
  ]
end
