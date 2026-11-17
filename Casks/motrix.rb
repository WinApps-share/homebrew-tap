cask "motrix" do
  arch arm: "arm64", intel: "x64"

  version "2.4.3"
  sha256 arm:   "ca9e6c3d195cc695928fc44f7826fc0f05384cb2dc9d863b9735e4610a162f56",
         intel: "fa48d07c107a6645c9ce742b47151659850b77dcee52c586d396e57194d379c3"

  url "https://github.com/agalwood/Motrix/releases/download/v#{version}/Motrix-#{version}-#{arch}.dmg"
  name "Motrix"
  desc "Open-source download manager"
  homepage "https://motrix.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Motrix.app"

  zap trash: [
    "~/Library/Application Support/Motrix",
    "~/Library/Caches/app.motrix.native",
    "~/Library/Logs/Motrix",
    "~/Library/Preferences/app.motrix.native.plist",
    "~/Library/Saved Application State/app.motrix.native.savedState",
  ]
end
