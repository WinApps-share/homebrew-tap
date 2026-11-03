cask "photocraft" do
  version "0.20.1"
  sha256 "5486555dc749df1650f321e363534e603a7c4f80ea31c54d9e88489ff742db03"

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
