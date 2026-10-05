cask "turbo-browser" do
  version "152.0.7977.125"
  sha256 "cfe14f9e9cb0d9487ab69825c6cab1b35d33d8b6d54f7cb04f4adf13c171f142"

  url "https://github.com/tbrowser/Turbo-Browser/releases/download/#{version}/TurboSetup_#{version}.dmg"
  name "Turbo Browser"
  desc "Purely efficient browser; Fast startup, high benchmark scores"
  homepage "https://tbrowser.cn/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Turbo.app"

  zap trash: [
    "~/Library/Application Support/Turbo",
    "~/Library/Caches/Turbo",
    "~/Library/Preferences/org.chromium.Turbo.plist",
  ]
end
