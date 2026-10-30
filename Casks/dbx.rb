cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.62"
  sha256 arm:   "9a98901c8639adeab9351fdf8ddb5944c0b86640ebac889e6e96dd9df65d634c",
         intel: "55cfc960349c0f128ed91aa0da5adbec7842c06b099284e37009d951dfc6c5e6"

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
