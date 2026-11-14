cask "i4" do
  arch arm: "arm64", intel: "x64"

  version "9.12.019"
  sha256 arm:   "1d2f7bd7de5429d2a599b4eb29782568d82eb153c86acc406095839b4f1f209e",
         intel: "e6f74f1a60a55bb19ff0dbbb4af3635f2e4fa1cc0252543ba9d156db22c16ce6"

  url "https://d-updater.i4.cn/i4tools9/download/macos/#{arch}/i4Tools_v#{version}_#{arch}.dmg",
      verified: "d-updater.i4.cn/i4tools9"
  name "i4Tools"
  desc "I4Tools is a software tool for managing iOS devices"
  homepage "https://www.i4.cn/"

  livecheck do
    url "https://url.i4.cn/FFRBr2aa"
    regex(/i4Tools[._-]v?(\d+(?:\.\d+)+)[._-](?:arm64|x64)\.dmg/i)
    strategy :header_match
  end

  depends_on macos: :monterey

  pkg "i4tools_#{arch}.pkg"

  uninstall quit:    "cn.i4tools.mac",
            pkgutil: "cn.i4tools.mac"

  zap trash: [
    "/private/var/db/receipts/cn.i4tools.mac.bom",
    "/private/var/db/receipts/cn.i4tools.mac.plist",
    "~/Library/Application Support/CrashReporter/i4Tools_*.plist",
    "~/Library/Application Support/i4Airplayer/",
    "~/Library/Application Support/i4Tools/",
    "~/Library/Preferences/cn.i4tools.mac.plist",
    "~/Library/Preferences/org.example.i4AirPlayer.plist",
    "~/Library/Saved Application State/org.example.i4AirPlayer.savedState",
  ]
end
