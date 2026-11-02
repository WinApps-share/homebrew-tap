cask "proxypin" do
  version "1.3.3"
  sha256 "ba8190b8f31ade5e54e2ad0939d99bf2a47960d60837b14ee3259afad3b7e26f"

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
