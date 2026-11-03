cask "compresso" do
  arch arm: "aarch64", intel: "x64"

  version "4.1.0"
  sha256 arm:   "d94f22d5e49fd6189a537be854bbf8f06db5d446e7fba20c6792eb99b3d14436",
         intel: "0a399b65a3d11a6350da8bfd62f2d74dff68149b498421abef874ecbcfb59f63"

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
