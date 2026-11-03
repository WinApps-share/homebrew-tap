cask "turbo-browser" do
  version "156.0.8078.81"
  sha256 "f329ef38f4a6ddeef1e25284d86c20012785e2933b4fe9255316cc4ab0b25c58"

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
