cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.98"
  sha256 arm:   "6d2b5bf9a9f41bfb6fb449fe73718ee42356bef1aac6a7b343ff7483d4a70dc8",
         intel: "d72a5aea55e8514f742ab9567016f2e7d4c44e8c190012e291997e42c876c5e1"

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
