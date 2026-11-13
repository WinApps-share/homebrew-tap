cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.70"
  sha256 arm:   "ad95660ad798fc479b9a8946efb1351b856f0826aa75224abb9746f5de324662",
         intel: "a89265dc74c654133a8624839a552b059eedfb377ffcb492e4be173420d93db6"

  url "https://github.com/t8y2/dbx/releases/download/v#{version}/DBX_#{version}_#{arch}.dmg"
  name "DBX"
  desc "Database management tool"
  homepage "https://dbxio.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "DBX.app"

  zap trash: [
    "~/Library/Application Support/com.dbx.app",
    "~/Library/Caches/com.dbx.app",
    "~/Library/Logs/com.dbx.app",
    "~/Library/Preferences/com.dbx.app.plist",
    "~/Library/WebKit/com.dbx.app",
  ]
end
