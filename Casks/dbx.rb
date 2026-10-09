cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.38"
  sha256 arm:   "770e04f42f6558c96abd89bd1101e35d705a8570a1e5f25e83e5ef8166d13253",
         intel: "07d8ae9dbddd113a966d3ee8795818c64023e0e8fd22b353a3e744db0b362ebc"

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
