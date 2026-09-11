# frozen_string_literal: true

cask "motrix-next" do
  arch arm: "aarch64", intel: "x64"

  version "3.9.9"
  sha256 arm:   "3d5d7c6648c15712fd08b0ae390599e0cd523f951448e36d53ae8355e13ecd47",
         intel: "ae5b4a04aa26eb89baca774c87627b3d24c67c3fae364f475855e83ee9864106"

  url "https://github.com/AnInsomniacy/motrix-next/releases/download/v#{version}/MotrixNext_#{version}_#{arch}.dmg",
      verified: "github.com/AnInsomniacy/motrix-next/"
  name "Motrix Next"
  desc "Full-featured download manager built with Tauri"
  homepage "https://motrix-next.pages.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "MotrixNext.app"

  zap trash: [
    "~/Library/Application Support/com.motrix.next",
    "~/Library/Caches/com.motrix.next",
    "~/Library/Logs/com.motrix.next",
    "~/Library/WebKit/com.motrix.next",
  ]
end
