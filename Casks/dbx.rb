cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.53"
  sha256 arm:   "f42bcf94c7bfac41906874542cba7eaf41eabd2eaf0f766099c90502d40f9ae8",
         intel: "4c3df34cfcb0fdcec87832228ad133495b048c18b8171d22d354ddbe30bf35fc"

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
