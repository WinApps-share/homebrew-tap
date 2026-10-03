cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.32"
  sha256 arm:   "cd6ce7e0c5e633d02fbd905f88d8249d59c1cb446cff8e2dd720f3c21d98d849",
         intel: "97f1c1f0e9b44c5f9cbb1a9814f643bc845f2fbb5aae32f53ad3067b1b39ba52"

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
