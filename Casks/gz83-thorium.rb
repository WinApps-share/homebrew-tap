cask "gz83-thorium" do
  arch arm: "ARM64", intel: "x64"

  version "M156.0.8078.80"
  sha256  arm:   "494675560b26350261ee8c8fca1ebe554ce15d2343276b2bab7f831ac89f9668",
          intel: "9fa26437a622775ebee99ff8c947e17a36567d88292642ce28aa2a7dbc01a761"

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
