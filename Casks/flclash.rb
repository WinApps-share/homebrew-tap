cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.3"
  sha256 arm:   "980e9cc3bd47d2090876e5e3c06f774e32a89330d83aa66ac3f8490e39924d9b",
         intel: "9738eebec4c8dd017bebb608f2d1e8c209cf5aa97cc4f181783036b66dd3c944"

  url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"
  name "FlClash"
  desc "Based on Clasheta, a multi-platform proxy client"
  homepage "https://github.com/chen08209/FlClash/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "FlClash.app"

  zap trash: [
    "~/Library/Application Support/com.follow.clash",
    "~/Library/Caches/com.follow.clash",
    "~/Library/Preferences/com.follow.clash.plist",
  ]
end
