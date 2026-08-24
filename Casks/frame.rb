cask "frame" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.33.0"
  sha256 arm:   "9be9f3d0a848b917100414e6fd74f78d639d2c2a59a7e7de36a4be0ee01c1f29",
         intel: "00df0ed1250655004e8652c78438ab33d339200fa1f55d4a47c09919740f19fa"

  url "https://github.com/66HEX/frame/releases/download/#{version}/Frame-#{arch}.dmg",
      verified: "github.com/66HEX/frame/"
  name "Frame"
  desc "FFmpeg GUI"
  homepage "https://www.framegui.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Frame.app"

  zap trash: [
    "~/Library/Application Support/Frame",
    "~/Library/Caches/Frame",
    "~/Library/Preferences/Frame.plist",
  ]
end
