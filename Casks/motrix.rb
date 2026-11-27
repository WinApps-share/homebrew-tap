cask "motrix" do
  arch arm: "arm64", intel: "x64"

  version "2.4.8"
  sha256 arm:   "dae99f8b5f29335a04273d9a461ceeeb647551dc95cbf4ff707db908c80798d8",
         intel: "1b532c38cde70352e4274b3ef177bb20bd2a1d4cc6a61eae5db4d99aa4d09fdd"

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
