cask "localsend" do
  version "1.18.2"
  sha256 "126860d56f6f49b11845f601aac51de27a49b16d2b48102415da91e0e37e5155"

  url "https://github.com/localsend/localsend/releases/download/v#{version}/LocalSend-#{version}.dmg",
      verified: "github.com/localsend/localsend/"
  name "LocalSend"
  desc "Open-source cross-platform alternative to AirDrop"
  homepage "https://localsend.org/"

  depends_on macos: :big_sur

  app "LocalSend.app"

  zap trash: [
    "~/Library/Application Scripts/org.localsend.localsendApp",
    "~/Library/Containers/org.localsend.localsendApp",
    "~/Library/Preferences/org.localsend.localsendApp.plist",
    "~/Library/Saved Application State/org.localsend.localsendApp.savedState",
  ]
end
