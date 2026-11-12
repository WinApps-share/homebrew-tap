cask "photocraft" do
  version "0.23.1"
  sha256 "606a52917188c65dc71709781180a0e3244e0f3b7f40b2f5b80170e87364420d"

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
