cask "cherry-studio" do
  arch arm: "arm64", intel: "x64"

  version "2.0.10"
  sha256 arm:   "15c6a6e248c1d2abac8432c133dd6ab73faeffb5bfc1cc4d36515db6c77a1324",
         intel: "495f808a6dabd2a9091954cf520a27f5508b90c250abc667e2ecd9885ddc170e"

  url "https://github.com/CherryHQ/cherry-studio/releases/download/v#{version}/Cherry-Studio-#{version}-mac-#{arch}.dmg",
      verified: "github.com/CherryHQ/cherry-studio/"
  name "Cherry Studio"
  desc "Desktop client that supports multiple LLM providers"
  homepage "https://www.cherry-ai.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

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
