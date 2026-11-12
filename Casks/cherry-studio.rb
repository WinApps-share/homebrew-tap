cask "cherry-studio" do
  arch arm: "arm64", intel: "x64"

  version "2.2.1"
  sha256 arm:   "6d74babc2114ec2de10074dfc03dcebe6fc5c90c5d5dba4ebcf5b0d7b7a4df5a",
         intel: "d23309bf2db73a95aa9725e99543c1bdb5be7ade1cc9e340c3ddc00bc74babe8"

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
