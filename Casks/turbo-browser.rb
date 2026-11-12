cask "turbo-browser" do
  version "156.0.8078.83"
  sha256 "909e7b86f96a189210a380eb28d717ee9875fcd6b051053276aba226ed2e6a1c"

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
