cask "ab-download-manager" do
  arch arm: "arm64", intel: "x64"

  version "1.11.0"
  sha256 arm:   "0e35931a2aa94c563069acc0f01066620e6bbcd76343389e52ddb115baea2293",
         intel: "4116d7169e8aa0a9a391a8486df1663184b8f7ffd95d8bde2ba45006f72c4cca"

  url "https://github.com/amir1376/ab-download-manager/releases/download/v#{version}/ABDownloadManager_#{version}_mac_#{arch}.dmg"
  name "AB Download Manager"
  desc "Download manager that speeds up your downloads"
  homepage "https://abdownloadmanager.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "ABDownloadManager.app"

  uninstall quit:       "com.abdownloadmanager.desktop",
            login_item: "ABDownloadManager",
            delete:     "~/Library/LaunchAgents/AB Download Manager.plist"

  zap trash: [
    "~/.abdm",
    "~/Library/Preferences/com.abdownloadmanager.desktop.desktop.plist",
  ]
end
