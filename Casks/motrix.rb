cask "motrix" do
  arch arm: "arm64", intel: "x64"

  version "2.4.2"
  sha256 arm:   "2388897f8cbeb1a26ec746d3de7a215c9c21b9d8b95f51a5c8af5827cafdfd88",
         intel: "baefbce7708269214a2c65fb80a5d9975e8ec3033919a81fb965b98deebcb051"

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
