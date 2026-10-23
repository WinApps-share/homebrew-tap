cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.52"
  sha256 arm:   "1652b94d79412e7a31c089266e20aa86f7c3d6f2745ab0f37b0ade7bd649caee",
         intel: "204744638de9030687b04aca4d52b87d42b7d61a978b719d91e846b167f73738"

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
