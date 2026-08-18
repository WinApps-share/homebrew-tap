# frozen_string_literal: true

cask "motrix-next" do
  arch arm: "aarch64", intel: "x64"

  version "3.9.7"
  sha256 arm:   "dbbed535789c321a471732a5b010a1cfc55040a9e3f61a45c4723f732e4f2105",
         intel: "3129c8bea563259d1385c9d213955ea71fa64897bd0fd1938d96cef4ad3bd088"

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
