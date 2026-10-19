cask "cherry-studio" do
  arch arm: "arm64", intel: "x64"

  version "2.1.7"
  sha256 arm:   "4dd498c502a696a03f8bf57bde660e35a19460c7a5545adc5ffd5ffde7c4e87d",
         intel: "94d8f7e0c58d678ea66a37fb51d8978d113ea39be3c784611c7efe146f0cb3c6"

  url "https://github.com/CherryHQ/cherry-studio/releases/download/v#{version}/Cherry-Studio-#{version}-mac-#{arch}.dmg"
  name "Cherry Studio"
  desc "Desktop client that supports multiple LLM providers"
  homepage "https://www.cherry-ai.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Cherry Studio.app"

  zap trash: [
    "~/Library/Application Support/CherryStudio",
    "~/Library/Caches/cherrystudio-updater",
    "~/Library/HTTPStorages/com.kangfenmao.CherryStudio",
    "~/Library/Logs/CherryStudio",
    "~/Library/Preferences/com.kangfenmao.CherryStudio.plist",
    "~/Library/Saved Application State/com.kangfenmao.CherryStudio.savedState",
  ]
end
