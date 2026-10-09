cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.37"
  sha256 arm:   "5964161bf8914e8f86d3905403e940d9ae8c91b1a110cd5a8d8bded868c72d5a",
         intel: "9e6ae7d3de5ab92d3d782e51c2f2e150e788d4bbf9a914db571974a5d0c23981"

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
