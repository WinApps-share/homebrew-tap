cask "drawio-desktop" do
  arch arm: "arm64", intel: "x64"

  version "31.3.2"
  sha256 arm:   "b6eda7e82bc09454274c03533bce30de170dfdee278ddf5e3c966d021fa16aee",
         intel: "13f12dddcf9960fb3d3783f2f6498ec5e7b93e7490926167b0590a6bd66d5cd2"

  url "https://github.com/jgraph/drawio-desktop/releases/download/v#{version}/draw.io-#{arch}-#{version}.dmg",
      verified: "github.com/jgraph/drawio-desktop/"
  name "draw.io"
  desc "Official electron build of draw.io"
  homepage "https://www.diagrams.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

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
