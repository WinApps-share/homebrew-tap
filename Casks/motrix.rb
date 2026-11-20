cask "motrix" do
  arch arm: "arm64", intel: "x64"

  version "2.4.5"
  sha256 arm:   "f540732f65f94a74d4c98544fd0a15e6b6a13c5049ec314409876f05869e0fc6",
         intel: "5bb8dcf265184bb647d05dbccce022f34412b5af29fea1ffb233205298a598eb"

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
