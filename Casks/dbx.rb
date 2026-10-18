cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.47"
  sha256 arm:   "d85c8bbb5023b3449b4289eec73f5c99743b9b9af30c9f8a4e183179a00e994e",
         intel: "70ae377746166979a9cee189602525cc454b151a38aed2c418bf8a868a6cb3f2"

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
