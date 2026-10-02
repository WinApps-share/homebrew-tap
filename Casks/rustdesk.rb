cask "rustdesk" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.5.0"
  sha256 arm:   "3929b0a4321e7d0f561a317059798be882d65decc59681eb77061f8efe56fbf4",
         intel: "1ca3cbfbe7f2bd28b50c93fcd50d4a0b671dc76d18be27cea99d3a65767eb526"

  url "https://github.com/rustdesk/rustdesk/releases/download/#{version}/rustdesk-#{version}-#{arch}.dmg",
      verified: "github.com/rustdesk/rustdesk/"
  name "RustDesk"
  desc "Open source virtual/remote desktop application"
  homepage "https://rustdesk.com/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:[.-]\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "RustDesk.app"

  uninstall quit: "com.carriez.rustdesk"

  zap trash: [
    "/Library/LaunchAgents/com.carriez.RustDesk_server.plist",
    "/Library/LaunchDaemons/com.carriez.RustDesk_service.plist",
    "~/Library/Logs/RustDesk",
    "~/Library/Preferences/com.carriez.RustDesk",
    "~/Library/Saved Application State/com.carriez.rustdesk.savedState",
  ]
end
