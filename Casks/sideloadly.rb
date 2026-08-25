cask "sideloadly" do
  version "0.60.0"
  sha256 "428d062af1ca819712fb12cb0ace25fa49c80d9735c73cda3cbaf09ffcd63212"

  url "https://sideloadly.io/SideloadlySetup.dmg?version=#{version}"
  name "Sideloadly"
  desc "Sideload IPA files to iOS devices"
  homepage "https://sideloadly.io/"

  livecheck do
    url "https://sideloadly.io/#changelog"
    regex(%r{v(\d+(?:\.\d+)+)</span>}i)
  end

  depends_on macos: :monterey

  app "Sideloadly.app"

  zap trash: [
    "~/Library/Application Support/CrashReporter/Sideloadly_32C71AA3-0CFC-5D9F-8204-620ECACFC378.plist",
    "~/Library/LaunchAgents/io.sideloadly.daemon.plist",
    "~/Library/Preferences/io.sideloadly.sideloadly.plist",
  ]

  caveats do
    requires_rosetta
  end
end
