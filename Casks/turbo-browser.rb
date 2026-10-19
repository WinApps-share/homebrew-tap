cask "turbo-browser" do
  version "154.0.8037.102"
  sha256 "fb75aa44bf3df028da4203380b1a5d788863c3abfe2d80a57d124d7daa076f53"

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
