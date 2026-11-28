cask "lx-music" do
  arch arm: "arm64", intel: "x64"

  version "2.12.7"
  sha256 arm:   "410fd4abd3a2f8fbabfe1dc31ca802b53fca50b65d4e78ce9ca4cbe6b04dad3d",
         intel: "9ce41421b72481a86262cb50b3aefbd4353078f4a0f36956ee86754c92d819c7"

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
