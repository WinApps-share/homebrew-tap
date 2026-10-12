cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.41"
  sha256 arm:   "bc91afc9f33fd8d036eba4e23b3511ba1b1f9744390cb74b80181e0fa6b6d3fe",
         intel: "33d14bbd9b6409474adec3f19a7d8b807c361b3541491c41aa76a5982d146a31"

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
