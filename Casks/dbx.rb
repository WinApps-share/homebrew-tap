cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.64"
  sha256 arm:   "999fbfcb7008adf9f819d114312071e88f4ca6b2ff083b6970c680ebe17d1164",
         intel: "3092fc9b0fc56229e41aa8a93839d9cc9f4782bf10b45b3253af6a478274d8df"

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
