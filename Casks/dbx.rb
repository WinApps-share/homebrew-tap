cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.46"
  sha256 arm:   "75f874dfb71bce5f466a5b6c04f80e49c05fedd00292ae11e90e5f7df3e16a52",
         intel: "fc4cf42d351e3f895e913f0273711eb4fc623f2caec27e25de83e388071ff199"

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
