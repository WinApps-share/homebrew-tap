cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.40"
  sha256 arm:   "d4a261ef967a13c5adaeb3a483b7b6f3f34da6a739f015b5ed8b5e2ab40bc7d9",
         intel: "33564193f25403560db7001cc483b616c1c6975a579485fc183007e650801283"

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
