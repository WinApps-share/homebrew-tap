cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.42"
  sha256 arm:   "f19b32de46ed7670e9974d7414b949868ca5128aa290df9ebbbc1790f0861012",
         intel: "968d53bb180171ae3ddac89cf710b213598ec003044e862bb027663c3b394c3f"

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
