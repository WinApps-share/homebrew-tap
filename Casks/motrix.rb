cask "motrix" do
  arch arm: "arm64", intel: "x64"

  version "2.4.7"
  sha256 arm:   "b76af07d2fe077b6916b343e22c369a1e7fca84330fcb866aeaf5f48905f6238",
         intel: "9856e69bc0a039033d74803b3c6623dbdff09967fe6da1bd4c613c8fd61de0a8"

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
