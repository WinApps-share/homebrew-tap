cask "ab-download-manager" do
  arch arm: "arm64", intel: "x64"

  version "1.11.4"
  sha256 arm:   "9c1c2955e2f62418441bd662b1d104e0a1b38775dd11232bb37be92ead24955d",
         intel: "2af7835cb665bc8ed3de4584d96b340d24461f28918f38ab7482431d4be870c3"

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
