cask "compresso" do
  arch arm: "aarch64", intel: "x64"

  version "4.0.0"
  sha256 arm:   "7048aa88f15c61d6054b660b562b7a6c184f4fafb719054111df2774c7f130d2",
         intel: "6d995cad42766e96bcce2b3af04cb929d22b50fd58f1ad41a112a75361ca7132"

  url "https://github.com/codeforreal1/compressO/releases/download/#{version}/CompressO_#{version}_#{arch}.dmg"
  name "CompressO"
  desc "Compress any video/image into a tiny size"
  homepage "https://github.com/codeforreal1/compressO"

  depends_on macos: :ventura # macOS 13

  app "CompressO.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/CompressO.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.compresso.app",
    "~/Library/Caches/com.compresso.app",
    "~/Library/Preferences/com.compresso.app.plist",
    "~/Library/Saved Application State/com.compresso.app.savedState",
  ]
end
