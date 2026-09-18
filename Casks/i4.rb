cask "i4" do
  arch arm: "arm64", intel: "x64"

  version "9.10.018"
  sha256 arm:   "a15ffd5061088743ef4abab503079f4e025ba0f90c3bc297f16f24afa5746151",
         intel: "0ba74943744d62736bc99e96cd83bc25e871c41de6b05beebd59b170994291aa"

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
