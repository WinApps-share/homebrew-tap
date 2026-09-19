cask "ab-download-manager" do
  arch arm: "arm64", intel: "x64"

  version "1.10.4"
  sha256 arm:   "94cb1a61db6c7f78748052057a8e4d8e8bcaa91a65e0a4cbd4da647bb1e88570",
         intel: "de32c670dd5b9c9d32162831f08d85b8007c0b0a37e5b7bb078421d54fc73cbb"

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
