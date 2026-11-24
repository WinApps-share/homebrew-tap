cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.74"
  sha256 arm:   "74a5e535721954b8206001fdcdb5edec20ed135d59874a437b6424717d501901",
         intel: "5a3b7823a02c6b7791f72ed1a8c09ee97ab6054b81412186f1de19cb1a8a9551"

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
