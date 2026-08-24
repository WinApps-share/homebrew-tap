cask "gz83-thorium" do
  arch arm: "ARM64", intel: "x64"

  version "M152.0.7977.55"
  sha256  arm:   "2fd9d3b47cbce042039e0d4cb22c9dad5f9b328e13f0e84270b58d8df0471ab8",
          intel: "b993fe1f9251b325b12f3705da6358cb8a921d3a0653ee930332f4f53f29c2be"

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
