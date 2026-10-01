cask "sideloadly" do
  version "0.70.1"
  sha256 "6cef94405a62d5c73e8c8cc9e4073935065763ffc1dd5a1a060acd625c17d164"

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
