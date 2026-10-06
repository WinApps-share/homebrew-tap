cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.35"
  sha256 arm:   "bee4fcb093936e06a5fb62921bd206d039f298ba5a4a5a281ae740099392df6c",
         intel: "4d1502f8678a9076525d615d9d7885e8be40f2a992f1bce9be8e9ef1765215ef"

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
