cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.55"
  sha256 arm:   "e4922847ddfeec40b2aa8a38331719ce6d47f3842d4962e3fa52c43c918fc465",
         intel: "6d7494eb25d2811dc16f9d5fc00df8f2cc490dd071ebad777a1eac87f85517cf"

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
