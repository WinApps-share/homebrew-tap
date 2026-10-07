cask "brave-browser" do
  arch arm: "arm64", intel: "x64"

  version "1.97.56"
  sha256 arm:   "3da1fb6e8b369c9dd1152afdf4d3cb24cb3c6215fabc520f8bff7cbb87f08587",
         intel: "90d957f5d76df028cbf3486fdd54f6ee81c584aad97acae508028b858686cb39"

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
