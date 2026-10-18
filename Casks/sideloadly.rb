cask "sideloadly" do
  version "0.71.0"
  sha256 "99c04e68678620378a16e791350eed81aba759590ba4dc9b808f2e088465b46e"

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
    "~/Library/Application Support/CrashReporter/Sideloadly_*.plist",
    "~/Library/LaunchAgents/io.sideloadly.daemon.plist",
    "~/Library/Preferences/io.sideloadly.sideloadly.plist",
  ]

  caveats do
    requires_rosetta
  end
end
