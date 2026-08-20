cask "res-downloader" do
  version "3.1.3"
  sha256 "4f371274a3318445d300332603fc95c89c0632498a186bb3b06eeb77ef7e413b"

  url "https://github.com/putyy/res-downloader/releases/download/#{version}/res-downloader_#{version}_mac.dmg"
  name "Res Downloader"
  desc "视频号、小程序、抖音、快手、小红书、直播流、m3u8、酷狗、QQ音乐等常见网络资源下载工具"
  homepage "https://github.com/putyy/res-downloader"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "res-downloader.app"

  zap trash: [
    "~/Library/Caches/com.wails.res-downloader",
    "~/Library/Preferences/com.wails.res-downloader.plist",
    "~/Library/Preferences/res-downloader",
    "~/Library/WebKit/com.wails.res-downloader",
  ]
end
