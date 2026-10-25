cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.54"
  sha256 arm:   "2c3f4e2b4dda6200f845581d7dcfe75dfa0ce23f0af3388343efbd9c9424dbd9",
         intel: "033b3c07e7042595d74b0b1b1e8105d6769c4ab30910c213263a7489ba7976ab"

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
