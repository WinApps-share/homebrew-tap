cask "lx-music" do
  arch arm: "arm64", intel: "x64"

  version "2.12.5"
  sha256 arm:   "f278aab64f793a4ffe8ba81fa0917a8b48e7fe8f58e4799a78860b71767cfc66",
         intel: "76acfb3dbb1697f2b9d355c8eb0097b879ec6e489cfa9d90012ea2a13e06a896"

  url "https://github.com/lyswhut/lx-music-desktop/releases/download/v#{version}/lx-music-desktop-#{version}-#{arch}.dmg"
  name "LX Music Assistant Desktop Edition"
  name "洛雪音乐"
  desc "Music app base on Electron & Vue"
  homepage "https://github.com/lyswhut/lx-music-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "lx-music-desktop.app"

  zap trash: [
    "~/Library/Application Support/lx-music-desktop",
    "~/Library/Logs/lx-music-desktop",
  ]
end
