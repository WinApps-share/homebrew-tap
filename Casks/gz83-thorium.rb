cask "gz83-thorium" do
  arch arm: "ARM64", intel: "x64"

  version "M154.0.8037.45"
  sha256  arm:   "394d3e2b401a013a706a4aee95e344ab1494bdf76269489dabd7a529636ffe00",
          intel: "99094963c978d7c59dd769733e09a79fb8e89a086a99a9b2a0ccb86e7f82ec75"

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
