cask "frame" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.33.1"
  sha256 arm:   "c1f1efc22da31f293cbe3bdc2f0adfb6ab22b73a058ad71de58342ecf74f8458",
         intel: "e9b6df8bb9752010b9e91532a974c3d49bce50493ff9493443b2bf89bc64e4ae"

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
