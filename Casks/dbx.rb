cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.36"
  sha256 arm:   "5f9b54fc3ba0d6dca1865dbd19bcd5e78a7ecdbb5ee6940d98463052df64b8ac",
         intel: "1618f7a1a604f09ffbb1f270221dd43253b4a189f422aa0a5abbd4423d115740"

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
