cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.65"
  sha256 arm:   "7c662106873e1ded192e8ee50fdfbe4dbfb13d12ee6e9a166c69ffbc27da464d",
         intel: "d8a27cd0074673a16f70ac360a47090820a08ed56b3f5a3f5fcc32cb5b20018f"

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
