cask "flclash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.2"
  sha256 arm:   "216f71773b70941afe3f6d1df6f21df05810e109bb8075f44560a0349e66e0d2",
         intel: "e545c5539c631c0116e9d58a04b3fb95ce587304616e85489ba15a54e8c7eb70"

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
