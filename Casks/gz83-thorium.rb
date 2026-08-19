cask "gz83-thorium" do
  arch arm: "ARM64", intel: "x64"

  version "M151.0.7922.72"
  sha256  arm:   "084cb61f3e64bfac60df26bf20b4195c934bbd1420ab9f75d01491a691e4872e",
          intel: "b060d55c462cd3e8d1836758210166201c5d53116cfdf51dcedaebce5a8d042a"

  url "https://github.com/gz83/thorium/releases/download/#{version}/Thorium_MacOS_#{arch}.dmg"
  name "Thorium"
  desc "Chromium-based web browser"
  homepage "https://github.com/gz83/thorium"

  livecheck do
    url :url
    regex(/^(M?\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :big_sur

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
