cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.34"
  sha256 arm:   "26475cd41f6a369a10eadbf0af25030e4464c9f5a6ac141fcc824f82cd12cf6f",
         intel: "f561514f382750d3edccb22dc28f54ee13a9a8514575b3a4384a067e820768bb"

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
