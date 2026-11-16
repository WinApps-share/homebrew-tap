cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.71"
  sha256 arm:   "afeb94d983435117776fdfc491c6e91106d4aac01620073c9107d06ba5634a69",
         intel: "be62dde00b2e829ead60279cebbb2b4c5310bd31a5dfed77aa9d041eb870d578"

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
