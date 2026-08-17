# frozen_string_literal: true

cask "neat-download-manager" do
  version "1.3"
  sha256 "c0e301ee4b13504a76eb6c54846c9dcf6d8148d32489b4bb91bd2062d471ef81"

  url "https://www.neatdownloadmanager.com/file/NeatDMInstaller.dmg"
  name "Neat Download Manager"
  name "NDM"
  desc "Multi-threaded download manager"
  homepage "https://www.neatdownloadmanager.com/index.php"

  app "NeatDownloadManager.app"

  zap trash: [
    "~/Library/Application Support/NeatDownloadManager",
    "~/Library/Preferences/com.NeatDownloadManager.plist",
  ]
end
