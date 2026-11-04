cask "proxypin" do
  version "1.4.0"
  sha256 "abeddc4276f7b8d127e486b2a18384c8615e04708f6db0f18a83fc822d55d761"

  url "https://github.com/wanghongenpin/proxypin/releases/download/v#{version}/proxypin-macos-#{version}.dmg"
  name "ProxyPin"
  desc "开源的跨平台 HTTP/HTTPS 抓包工具"
  homepage "https://github.com/wanghongenpin/proxypin"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "ProxyPin.app"

  zap trash: [
    "~/Library/Application Support/ProxyPin",
    "~/Library/Caches/com.proxy.pin",
    "~/Library/Preferences/com.proxy.pin.plist",
  ]
end
