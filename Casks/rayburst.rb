# frozen_string_literal: true

cask "rayburst" do
  arch arm: "aarch64", intel: "x64"

  version "4.1.2"
  sha256 arm:   "ed54a1d1bf0d4b0819aa24c7ee4c662f5e1e1e4555ef48f8e6299a3ea8cc6d1c",
         intel: "c9892990659893bba7737eb68daf801864a861e8e180f3ef9987ebeb3c9f1c8a"

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
