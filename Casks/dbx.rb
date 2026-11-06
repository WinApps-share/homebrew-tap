cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.67"
  sha256 arm:   "8cb722db0ed3d1d4b5cc327bc0f02d40ba39bdc63bcf48da281236de998a3293",
         intel: "7e72bac8946eb6c782ad8fe9762b4c6e3f758350c507d6894997c9fac612ff25"

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
