cask "bongocat" do
  arch arm: "aarch64", intel: "x64"

  version "2.4.1"
  sha256 arm:   "4cfa1e959e6ec0827d53872987561e0b3c0daf38465d350374fd774ab0dd59a4",
         intel: "d3814a583a128b7ade3f94df11431e7e29a0dd8b8a14a39bc943d857d0fbca1a"

  url "https://github.com/ayangweb/BongoCat/releases/download/v#{version}/BongoCat-#{version}-#{arch}.dmg"
  name "BongoCat"
  desc "小猫桌宠互动软件"
  homepage "https://github.com/ayangweb/BongoCat"

  depends_on macos: :monterey

  app "BongoCat.app"

  zap trash: [
    "~/Library/Application Support/com.ayangweb.BongoCat",
    "~/Library/Caches/com.ayangweb.BongoCat",
    "~/Library/Logs/com.ayangweb.BongoCat",
    "~/Library/WebKit/com.ayangweb.BongoCat",
  ]
end
