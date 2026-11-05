cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.66"
  sha256 arm:   "9b7abbdc70c693184f6b15621d246204361ffe9612fb8cfb84414b054b9c2813",
         intel: "6704ce35a0de8c01866d1768ab11da7ba7740701d159c68694ee463612f46bc5"

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
