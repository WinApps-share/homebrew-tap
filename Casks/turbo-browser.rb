cask "turbo-browser" do
  version "156.0.8078.86"
  sha256 "8194af03389aced1db8f0231c76fff1dcb5e486231fd18eb8b138c01a09a9a79"

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
