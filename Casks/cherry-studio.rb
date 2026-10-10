cask "cherry-studio" do
  arch arm: "arm64", intel: "x64"

  version "2.1.5"
  sha256 arm:   "e23132d9d69f1c0d100cbfefaea754326833b8dc7587902f391a52dc0bbd60a7",
         intel: "8339462fdbae118668458cdfc39ee0973b031abd00addbb3e5c0fb559fee1773"

  url "https://github.com/CherryHQ/cherry-studio/releases/download/v#{version}/Cherry-Studio-#{version}-mac-#{arch}.dmg"
  name "Cherry Studio"
  desc "Desktop client that supports multiple LLM providers"
  homepage "https://www.cherry-ai.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Cherry Studio.app"

  zap trash: [
    "~/Library/Application Support/CherryStudio",
    "~/Library/Caches/cherrystudio-updater",
    "~/Library/HTTPStorages/com.kangfenmao.CherryStudio",
    "~/Library/Logs/CherryStudio",
    "~/Library/Preferences/com.kangfenmao.CherryStudio.plist",
    "~/Library/Saved Application State/com.kangfenmao.CherryStudio.savedState",
  ]
end
