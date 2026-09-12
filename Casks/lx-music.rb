cask "lx-music" do
  arch arm: "arm64", intel: "x64"

  version "2.12.4"
  sha256 arm:   "923b7d962fb20d95b0ef21ce08b3e12ebc0485fda095a0732fbb7fe6bd9c5bbe",
         intel: "f28236ead7ba275155290cd20ef7059e50318c02d0e088d9ed9ad6314aa313fd"

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
