cask "opencode-desktop" do
  arch arm: "arm64", intel: "x64"

  version "1.18.30"
  sha256 arm:   "d83737520b454681cde75b248a60595e57518c742861fd5ea07798ad3f52fb68",
         intel: "ead3369f35d582cfb3e40df5062a65228642ad50ade9783894ad7d635f08c691"

  url "https://github.com/anomalyco/opencode/releases/download/v#{version}/opencode-desktop-mac-#{arch}.dmg"
  name "OpenCode"
  desc "AI coding agent desktop client"
  homepage "https://opencode.ai/"

  livecheck do
    url "https://github.com/anomalyco/opencode/releases/latest/download/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "OpenCode.app"

  zap trash: [
    "~/Library/Application Support/ai.opencode.desktop",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/ai.opencode.desktop.sfl*",
    "~/Library/Caches/ai.opencode.desktop",
    "~/Library/HTTPStorages/ai.opencode.desktop",
    "~/Library/Logs/ai.opencode.desktop",
    "~/Library/Preferences/ai.opencode.desktop.plist",
    "~/Library/Saved Application State/ai.opencode.desktop.savedState",
    "~/Library/WebKit/ai.opencode.desktop",
  ]
end
