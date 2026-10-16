cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.45"
  sha256 arm:   "392100c99815a8097a51bfc3d61caf6b54769a77ece3e0b8b4ba7ac44be6a9a3",
         intel: "04cc5538ce24e35ed205829e9a5c67ae70bc8c0acdbeb542ea9fadcc97d933b4"

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
