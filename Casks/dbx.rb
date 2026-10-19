cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.48"
  sha256 arm:   "cb397c0582984e5b0ede2320753046486f1dece53f36d7585d3f4751cedc857c",
         intel: "7def855baba59d3dbad042ffb372238900a9fc0937d32ed6be65d4f808affab5"

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
