cask "bongocat" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "ca6a890b9c1754b8f828627f2d6864b177d5cb0efca1342f7c7da88dcaf1e94e",
         intel: "7264690b9f33606ce960f274236acee111ce34ff061886ae5c2d5a154c9b4b77"

  url "https://github.com/ayangweb/BongoCat/releases/download/v#{version}/BongoCat_#{version}_#{arch}.dmg"
  name "BongoCat"
  desc "小猫桌宠互动软件"
  homepage "https://github.com/ayangweb/BongoCat"

  depends_on :macos

  app "BongoCat.app"

  zap trash: [
    "~/Library/Application Support/com.ayangweb.BongoCat",
    "~/Library/Caches/com.ayangweb.BongoCat",
    "~/Library/Logs/com.ayangweb.BongoCat",
    "~/Library/WebKit/com.ayangweb.BongoCat",
  ]
end
