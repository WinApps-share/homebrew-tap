cask "brave-browser" do
  arch arm: "arm64", intel: "x64"

  version "1.99.55"
  sha256 arm:   "05dd300d93f6cc7b56c9b5b95cfbad5facbd5a6ae8c1f7d0d6be0d162f870b1d",
         intel: "aadab3cade4980db57815e4b5bb87453edf82ff8dead23f06b2f533b665192e5"

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
