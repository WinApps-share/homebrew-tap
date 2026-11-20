cask "obs" do
  arch arm: "apple", intel: "Intel"

  version "33.0.2"
  sha256 arm:   "f9cd96511c5efdd3ffd9a0068e3bbc276c61fc451d1004e3eea5658a9cb70488",
         intel: "84eb584a89cdef83f3385655e348496dbb0715459be249afa1c6787d60d2cc33"

  url "https://github.com/obsproject/obs-studio/releases/download/#{version}/OBS-Studio-#{version}-macOS-#{arch}.dmg",
      verified: "github.com/obsproject/obs-studio/"
  name "OBS Studio"
  desc "Free and open source software for video recording and live streaming"
  homepage "https://obsproject.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "OBS.app"

  zap trash: [
    "~/Library/Application Support/obs-studio",
    "~/Library/Caches/com.obsproject.obs-studio",
    "~/Library/HTTPStorages/com.obsproject.obs-studio",
    "~/Library/Preferences/com.obsproject.obs-studio.plist",
    "~/Library/WebKit/com.obsproject.obs-studio",
  ]
end
