cask "gz83-thorium" do
  arch arm: "ARM64", intel: "x64"

  version "M156.0.8078.28"
  sha256  arm:   "15ae5b02af047b15f442317c5a8a3afad0a7656dd97201e4a79878b74db3c29e",
          intel: "090d40d6d1318e5e28eb8c5d4313f898d0e2a3f1c1d38d22cb12d9dd38ea1421"

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
