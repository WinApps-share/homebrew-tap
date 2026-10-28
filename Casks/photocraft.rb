cask "photocraft" do
  version "0.17.0"
  sha256 "6e0903172a7440ce4e71002f5585ba4eff588fa3fc99b78cd9811180cabd5b80"

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
