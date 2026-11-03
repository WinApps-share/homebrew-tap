cask "motrix" do
  arch arm: "arm64", intel: "x64"

  version "2.2.1"
  sha256 arm:   "870b9ba65a7bb5a84c7383ea5d0cf7ef599d246481dfac7e21e9e1d92ff4d13a",
         intel: "203a61b5d40355c16c20d05ef47456e5a95ea818f9f3765540a4a294649e3c6c"

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
