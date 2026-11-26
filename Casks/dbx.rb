cask "dbx" do
  arch arm: "arm64", intel: "x64"

  version "0.6.75"
  sha256 arm:   "b1334348ac694efcd3af03211a4af9caa4b27be1c03e93db5ec50181b4d178da",
         intel: "f96f25d7be887f9d2dc25fd94e26aaa687ff76e91d5100f452f81fca80386d04"

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
