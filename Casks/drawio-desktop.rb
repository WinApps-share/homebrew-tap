cask "drawio-desktop" do
  arch arm: "arm64", intel: "x64"

  version "31.4.4"
  sha256 arm:   "46d8f352d51ec8a036e4ad2a166e4b00eb9a6d2aec758619cddaa1fae16b7929",
         intel: "b3cf4a3aabe260ac14bb9c029fdbc692b19ebaabe8940a94fda8ae1784d0891d"

  url "https://github.com/jgraph/drawio-desktop/releases/download/v#{version}/draw.io-#{arch}-#{version}.dmg"
  name "draw.io"
  desc "Official electron build of draw.io"
  homepage "https://www.diagrams.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "draw.io.app"

  zap trash: [
    "~/Library/Application Support/draw.io",
    "~/Library/Caches/com.jgraph.drawio.desktop",
    "~/Library/Caches/com.jgraph.drawio.desktop.ShipIt",
    "~/Library/Caches/draw.io-updater",
    "~/Library/HTTPStorages/com.jgraph.drawio.desktop",
    "~/Library/Logs/draw.io",
    "~/Library/Preferences/ByHost/com.jgraph.drawio.desktop.ShipIt.*.plist",
    "~/Library/Preferences/com.jgraph.drawio.desktop.helper.plist",
    "~/Library/Preferences/com.jgraph.drawio.desktop.plist",
    "~/Library/Saved Application State/com.jgraph.drawio.desktop.savedState",
    "~/Library/WebKit/com.jgraph.drawio.desktop",
  ]
end
