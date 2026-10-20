# frozen_string_literal: true

cask "rayburst" do
  arch arm: "aarch64", intel: "x64"

  version "4.1.0"
  sha256 arm:   "94d10fb28b9cb0d02acd562ca45beba426d8f58dd777a492c5bdab5c73ea0d60",
         intel: "8e03ec541881a677b3a3c46101563bdaa83d850a1be983293897d904d26b4a58"

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
