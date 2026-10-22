cask "brave-browser" do
  arch arm: "arm64", intel: "x64"

  version "1.98.60"
  sha256 arm:   "750b959778670a71b76c60bab2664ebc29f0b3b6093acdc8acf5186f46debb7d",
         intel: "581e0ac829a2b694de4d38a28f7f7fd399b7d28021539ec6c2003b16e30156ae"

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
