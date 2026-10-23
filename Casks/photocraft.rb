cask "photocraft" do
  version "0.14.0"
  sha256 "b1b81f1d4b433578e6b9d2b9800e18d8e5fb60ebbc38977918d3529d1bdb140a"

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
