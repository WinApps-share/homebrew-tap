cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.39"
  sha256 arm:   "bd10deb1cdb907c7f4f4d34b2a3c28db1d6cbb81409325cceb4ac9c985c997fc",
         intel: "715263dcc9e340f5833322972c43837cd5c4652ab672c2e83d4b140a4d8abf69"

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
