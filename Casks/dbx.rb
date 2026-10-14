cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.43"
  sha256 arm:   "4c9e4c458393150e27c6fb7207355db69319ae16d463b0d02de3f156725bc426",
         intel: "5cafd17633b5888c98c46c18930139d7cbda8146e53ec9ee624c9e1320c2f3db"

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
