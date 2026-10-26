cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.56"
  sha256 arm:   "b8683fd1ea3fc8874d5b33564a19672da5720094a0317e7c5980050e958b0e4c",
         intel: "6a5112678743069aaa10e9fb9fca06b7666ec2b26d0dfa0a085703aa28d3bd2b"

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
