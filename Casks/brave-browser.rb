cask "brave-browser" do
  arch arm: "arm64", intel: "x64"

  version "1.96.60"
  sha256 arm:   "da1e3cf607c3d15d2435a60c652ad7a7df17b4d26dc6fd441b6484a5042ac10d",
         intel: "32103789f12f0fbe2d688d80b4d330966d50ae1dc2eb8554fb292a52b0572d13"

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
