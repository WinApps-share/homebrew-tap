cask "gz83-thorium" do
  arch arm: "ARM64", intel: "x64"

  version "M158.0.8127.41"
  sha256  arm:   "a470ccc26912dbef04c06a9d8dc0100a8da5efdace16d8f14e9bf3ec316ebe30",
          intel: "22f936bbd16f3b37867f0cba7361a5ff485374836fa70569f5316fa2e93467fd"

  url "https://github.com/gz83/thorium/releases/download/#{version}/Thorium_MacOS_#{arch}.dmg"
  name "Thorium"
  desc "Chromium-based web browser"
  homepage "https://github.com/gz83/thorium"

  livecheck do
    url :url
    regex(/^(M?\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Thorium.app", target: "Thorium Browser.app"
  command_wrapper "thorium",
                  executable: "#{appdir}/Thorium Browser.app/Contents/MacOS/Thorium"

  zap trash: [
    "~/Library/Application Support/Thorium",
    "~/Library/Caches/Thorium",
    "~/Library/Preferences/org.chromium.Thorium.plist",
    "~/Library/Saved Application State/org.chromium.Thorium.savedState",
  ]
end
