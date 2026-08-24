cask "musicfree" do
  arch arm: "arm64", intel: "x64"

  version "0.0.8"
  sha256 arm:   "f91551ac7119a121b34ddf86d49d59aea7b1084b25d919fae807b780fe1bd49b",
         intel: "98755f4740116c0b365ea7f64532780e59d84b09d3f3fcce73be4a45bc0cef23"

  url "https://github.com/maotoumao/MusicFreeDesktop/releases/download/v#{version}/MusicFree-#{version}-darwin-#{arch}.dmg"
  name "MusicFree"
  desc "插件化、定制化、无广告的免费音乐播放器"
  homepage "https://github.com/maotoumao/MusicFreeDesktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "MusicFree.app"

  zap trash: [
    "/Users/ayong/Library/Application Support/MusicFree",
    "/Users/ayong/Library/Logs/MusicFree",
    "/Users/ayong/Library/Preferences/fun.upup.musicfree.plist",
  ]
end
