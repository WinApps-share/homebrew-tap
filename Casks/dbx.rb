cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.50"
  sha256 arm:   "5c478cde8d6dcd53a4a721a099ad2fb6cbb72fd9f9e9d73cf45fb7ab106d462a",
         intel: "dc0d91604caf81f9b4ff238398490a8212097b73616da4aa32695b23f42d7d98"

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
