cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.73"
  sha256 arm:   "6f30f7524dc69f59ec7fa3d98ce8fd7230d0cda893aac6d2c411e36eae32d263",
         intel: "d4bba3a62c4fe9552ef271c5b8b164c05e89886bb04e9bd24d127d5f1cbc4135"

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
