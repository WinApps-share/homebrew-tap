cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.59"
  sha256 arm:   "3c28d7a1cec901bcecff02d12cd95a3c3a016b128d791195edf670fb922cde05",
         intel: "65d93aba0bda636383f8996e1184c6e82b1397bd2b6df304d283388a1832820c"

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
