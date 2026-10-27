cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.57"
  sha256 arm:   "6ca7d443b09e98e53326001229740166bb013d7ccab14dac0f96d470089ad2d3",
         intel: "f97bb694547f190dcd5073918f0bb8e63e00fe2f5a1016ceda029dcb986c17bb"

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
