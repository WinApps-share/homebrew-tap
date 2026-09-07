# frozen_string_literal: true

cask "motrix-next" do
  arch arm: "aarch64", intel: "x64"

  version "3.9.8"
  sha256 arm:   "bae521515cdd283129d8945d0e229163e0d7750d478c0226e308de0818eff8f6",
         intel: "03a6809745ba9b1d09e4e0ca86bf1eaecfd8ecc3b048cf918317057b50fdb02b"

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
