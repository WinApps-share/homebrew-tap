cask "proxypin" do
  version "1.3.1"
  sha256 "d4c2d189094346d6441b2434c522caf3342c1653fe1cc0b1f27788b75118ef09"

  url "https://github.com/wanghongenpin/proxypin/releases/download/v#{version}/proxypin-macos.dmg"
  name "ProxyPin"
  desc "开源的跨平台 HTTP/HTTPS 抓包工具"
  homepage "https://github.com/wanghongenpin/proxypin"

  livecheck do
    url :url
    strategy :github_latest
  end

  # DMG 中的 Info.plist 声明 LSMinimumSystemVersion 为 10.15（Catalina）
  depends_on macos: :catalina

  app "ProxyPin.app"

  zap trash: [
    "~/Library/Application Support/ProxyPin",
    "~/Library/Caches/com.proxy.pin",
    "~/Library/Preferences/com.proxy.pin.plist",
  ]
end
