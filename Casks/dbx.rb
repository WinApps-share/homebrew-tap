cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.58"
  sha256 arm:   "8e0933cb87980bb8b0fe9b197b809a6156ef6dc3c7e5987112f57a1b88577d46",
         intel: "50489cdb9cd954a557e19e898eaebce05acbb526c41b49b0f3037ddfb65f9240"

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
