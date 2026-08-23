cask "rubick" do
  arch arm: "arm64", intel: "x64"

  version "4.3.8"
  sha256 arm:   "1c61e3c8f9d44b43026f6c432f6b7e26a4fd56dc8cb496d65ce788708dc90595",
         intel: "69c75de2fcc30da7cb7de85c07e6751ddaf54d242bfaa25cddab0fcf0273e4d0"

  url "https://github.com/rubickCenter/rubick/releases/download/v#{version}/rubick-#{version}-#{arch}.dmg"
  name "Rubick"
  desc "Electron based open source toolbox, free integration of rich plug-ins"
  homepage "https://rubickcenter.github.io/rubick/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "rubick.app"

  zap trash: [
    "~/Library/Application Support/CrashReporter/rubick_32C71AA3-0CFC-5D9F-8204-620ECACFC378.plist",
    "~/Library/Application Support/rubick",
    "~/Library/Logs/DiagnosticReports/rubick-2026-08-23-204253.ips",
    "~/Library/Preferences/com.muwoo.rubick.plist",
    "~/Library/Services/rubick.workflow",
  ]
end
