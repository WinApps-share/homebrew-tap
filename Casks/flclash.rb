cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.5"
  sha256 arm:   "0a350209c2a1ef8d181a3d0dd563ae8f86aece161f5a4e8554683caf5020bd82",
         intel: "69d68de2c4da721e554d03f9529521afb4b75334d87306be8906416e6af6fab8"

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
