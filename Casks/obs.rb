cask "obs" do
  arch arm: "apple", intel: "Intel"

  version "33.0.3"
  sha256 arm:   "92212873b6f84c54285203cac3f846590ac00dfad76b312cf266100ff5edf0c8",
         intel: "45269723d1265563524cb3d635fe090a0b0e1104e3a2eb02ee5355bd16742903"

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
