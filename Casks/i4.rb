cask "i4" do
  arch arm: "arm64", intel: "x64"

  version "9.12.015"
  sha256 arm:   "b688aa37d08f99024fcf0679cf41956f221e852bff341f0b6d13b5e535339e05",
         intel: "2efcf85a65407634627a0ee52522814411c4b9b213d45e0d39313fc9cd7a1052"

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
