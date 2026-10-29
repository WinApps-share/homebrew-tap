cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.61"
  sha256 arm:   "c4a6109f81378a1997e916369dc191d9026b1d5108b1b3f063a7152676c80b25",
         intel: "85f26b3aba7e9efecdf19beca3f1bd0e3f824a1edfde7988eb802f030beb450f"

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
