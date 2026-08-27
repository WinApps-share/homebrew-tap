cask "brave-browser" do
  arch arm: "arm64", intel: "x64"

  version "1.94.117"
  sha256 arm:   "b2c57075f6c047c0f849abee965c124b43909b4d93e350a85f7f5dae12a48db1",
         intel: "eac356a06173e1040d72a1ae1c72b993a1cfb2c6e835d7800a3a70cc2db79db2"

  url "https://github.com/brave/brave-browser/releases/download/v#{version}/Brave-Browser-#{arch}.dmg",
      verified: "github.com/brave/brave-browser/"
  name "Brave"
  desc "Web browser focusing on privacy"
  homepage "https://brave.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Brave Browser.app"

  zap trash: [
        "~/Library/Application Support/BraveSoftware/Brave-Browser",
        "~/Library/Caches/BraveSoftware/Brave-Browser",
        "~/Library/Caches/com.brave.Browser",
        "~/Library/HTTPStorages/com.brave.Browser",
        "~/Library/Preferences/com.brave.Browser.plist",
        "~/Library/Saved Application State/com.brave.Browser.savedState",
      ],
      rmdir: [
        "~/Library/Application Support/BraveSoftware",
        "~/Library/Caches/BraveSoftware",
      ]
end
