cask "cherry-studio" do
  arch arm: "arm64", intel: "x64"

  version "2.1.10"
  sha256 arm:   "9b2f17d6e2ded803304e7bb26ca7b05e2aeb50290053487a33f8d8195bfa6180",
         intel: "385c39ed6b569067f1a4b567b267f3a3d4eb10a3e5ec2415e25f37f3c6b00c48"

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
