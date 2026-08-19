cask "obs" do
  arch arm: "apple", intel: "Intel"

  version "32.2.2"
  sha256 arm:   "920d6f26703d2df6e4085bd3c1cbed30488325084136c7a6e9e37021fbd6aaf7",
         intel: "f8d8afe3dffdc86efa0698c02ff0c997866bac3e6208ddaf56d37108baacf197"

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
