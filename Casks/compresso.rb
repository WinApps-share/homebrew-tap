cask "compresso" do
  arch arm: "aarch64", intel: "x64"

  version "3.0.0"
  sha256 arm:   "5fe9e0b55d291328b13b867c817dd9339078f724339f01e57484972f4c088c3a",
         intel: "58c586817e38614bb7cf01ae13acb69ca60bb682156da8b99447165c2c6d3090"

  url "https://github.com/codeforreal1/compressO/releases/download/#{version}/CompressO_#{version}_#{arch}.dmg"
  name "CompressO"
  desc "Compress any video/image into a tiny size"
  homepage "https://github.com/codeforreal1/compressO"

  depends_on macos: :ventura # macOS 13

  app "CompressO.app"

  postflight do
    system "xattr", "-dr", "com.apple.quarantine", "#{appdir}/CompressO.app"
  end

  zap trash: [
    "~/Library/Application Support/com.compresso.app",
    "~/Library/Caches/com.compresso.app",
    "~/Library/Preferences/com.compresso.app.plist",
    "~/Library/Saved Application State/com.compresso.app.savedState",
  ]
end
