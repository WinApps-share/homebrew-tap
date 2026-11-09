cask "motrix" do
  arch arm: "arm64", intel: "x64"

  version "2.4.1"
  sha256 arm:   "c90b30594562958bf683e6ae2d47927a7c2fbb597f249406e7192eee793798b1",
         intel: "b69170f8ee0e7a2c99f22cdbe4abbb570cab687987586b9381ce7c912b1e0019"

  url "https://github.com/agalwood/Motrix/releases/download/v#{version}/Motrix-#{version}-#{arch}.dmg"
  name "Motrix"
  desc "Open-source download manager"
  homepage "https://motrix.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Motrix.app"

  zap trash: [
    "~/Library/Application Support/Motrix",
    "~/Library/Caches/app.motrix.native",
    "~/Library/Logs/Motrix",
    "~/Library/Preferences/app.motrix.native.plist",
    "~/Library/Saved Application State/app.motrix.native.savedState",
  ]
end
