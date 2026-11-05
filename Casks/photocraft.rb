cask "photocraft" do
  version "0.20.2"
  sha256 "89f2ed4d4a737ec8aaa570165815bab0a824df3f453493b0a501f915179e9a55"

  url "https://github.com/storytold/photocraft/releases/download/v#{version}/photocraft-#{version}-macos-universal.dmg"
  name "PhotoCraft"
  desc "Image editor"
  homepage "https://getartcraft.com/apps/photocraft"

  depends_on :macos

  app "PhotoCraft.app"

  zap trash: [
    "~/Library/Application Support/Photocraft",
    "~/Library/Preferences/ai.storyteller.photocraft.plist",
  ]
end
