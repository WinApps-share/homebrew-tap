cask "gopeed-app" do
  arch arm: "arm64", intel: "amd64"

  version "1.9.3"
  sha256 arm:   "7e1b6c8e9270d99e0d0238efbd53072b58847ffd71d13c3cc8cf203f99c4769e",
         intel: "fdb6be465be15765c953731e83c48a9e2bb3edf0eff3acd3162b80f94df30cac"

  url "https://github.com/GopeedLab/gopeed/releases/download/v#{version}/Gopeed-v#{version}-macos-#{arch}.dmg",
      verified: "github.com/GopeedLab/gopeed/"
  name "Gopeed"
  desc "跨平台的 Gopeed 多线程下载器"
  homepage "https://gopeed.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :catalina

  app "Gopeed.app"

  zap trash: [
    "~/Library/Application Support/com.gopeed.gopeed",
    "~/Library/Application Support/CrashReporter/Gopeed_32C71AA3-0CFC-5D9F-8204-620ECACFC378.plist",
    "~/Library/Preferences/com.gopeed.gopeed.plist",
  ]
end
