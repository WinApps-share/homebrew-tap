cask "obs" do
  arch arm: "apple", intel: "Intel"

  version "33.0.1"
  sha256 arm:   "3d6b2eedeb56416602af635adaba32327fdf11ff9d2806a4ce7d5b608de73238",
         intel: "745257d65e06eb0f784af229659223a863ad50d036464bb2b52f8a2d9278c2b1"

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
