cask "obs" do
  arch arm: "apple", intel: "Intel"

  version "33.0.0"
  sha256 arm:   "b36f4e9da5f2f17c733ba711c8fe0656d6b0cd573cfe96eeb3e68325cffef739",
         intel: "8524ff428f038573f8905a206841081d3da9ec607063906f7bbfe38d55810c1c"

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
