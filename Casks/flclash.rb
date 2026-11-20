cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.4"
  sha256 arm:   "db0784e7e5a69fc93da85accf4d8d80812e7e014f2082609da395ba6124195c5",
         intel: "481f742112572a6488a5ec40ddd071283dc59eb4d91da1e399be25acaf79e8eb"

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
