cask "motrix" do
  arch arm: "arm64", intel: "x64"

  version "2.2.0"
  sha256 arm:   "d076bed3e13ac2c44b31f119501c8ac78e554e8833b3519a9d1359a16cce40b0",
         intel: "f81a57c6a9c3d06b58d13da9f8a9e1b1ff73e2a47654495149c3562b3586e7c1"

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
