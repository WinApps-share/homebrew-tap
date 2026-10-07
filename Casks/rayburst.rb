# frozen_string_literal: true

cask "rayburst" do
  arch arm: "aarch64", intel: "x64"

  version "4.0.1"
  sha256 arm:   "f4d1c40d7794dc7f42323001b472b2a722b168ace57e21074b9e780da883b3f2",
         intel: "2f2e1e56f7db4a5706600314d4a09893341043580281a36f4fa11ae7a94102f2"

  url "https://github.com/AnInsomniacy/rayburst/releases/download/v#{version}/Rayburst_#{version}_#{arch}.dmg"
  name "Rayburst"
  desc "Full-featured download manager built with Tauri"
  homepage "https://rayburst.pages.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Rayburst.app"

  zap trash: [
    "~/Library/Application Support/dev.aninsomniacy.rayburst",
    "~/Library/Caches/dev.aninsomniacy.rayburst",
    "~/Library/Logs/dev.aninsomniacy.rayburst",
    "~/Library/WebKit/dev.aninsomniacy.rayburst",
  ]
end
