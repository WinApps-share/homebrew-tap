cask "obs" do
  arch arm: "apple", intel: "Intel"

  version "32.2.1"
  sha256 arm:   "6120c995614be17ecd0ee0877514a88b121249e6261cde46d1440b87d7ffd70c",
         intel: "6900a7a6d4422956114cac3c148d871307fdb0530160c2cbb4e97f624c9f85a5"

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
  depends_on macos: ">= :ventura"

  app "OBS.app"

  zap trash: [
    "~/Library/Application Support/obs-studio",
    "~/Library/HTTPStorages/com.obsproject.obs-studio",
    "~/Library/Caches/com.obsproject.obs-studio",
    "~/Library/Preferences/com.obsproject.obs-studio.plist",
    "~/Library/WebKit/com.obsproject.obs-studio",
  ]
end
