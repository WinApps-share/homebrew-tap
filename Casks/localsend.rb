cask "localsend" do
  version "1.19.0"
  sha256 "5645789cc976298b893267c025f0945d8673baed3bb302a201eb8b96991e43d4"

  url "https://github.com/localsend/localsend/releases/download/v#{version}/LocalSend-#{version}.dmg",
      verified: "github.com/localsend/localsend/"
  name "LocalSend"
  desc "Open-source cross-platform alternative to AirDrop"
  homepage "https://localsend.org/"

  depends_on :macos

  app "LocalSend.app"

  zap trash: [
    "~/Library/Application Scripts/org.localsend.localsendApp",
    "~/Library/Containers/org.localsend.localsendApp",
    "~/Library/Preferences/org.localsend.localsendApp.plist",
    "~/Library/Saved Application State/org.localsend.localsendApp.savedState",
  ]
end
