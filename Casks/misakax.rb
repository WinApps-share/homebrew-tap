cask "misakax" do
  version "2.2"
  sha256 "5434f69f213d0d385b489008a157e58b2606e3a23e3302ed2c169085c6c98d27"

  url "https://github.com/straight-tamago/misakaX/releases/download/#{version}/misakaX-#{version}-macOS-edition.zip"
  name "misakaX"
  desc "Ultimate customization tool for iOS /iPadOS 16.0 - 18.0 / 18.1 beta 4"
  homepage "https://github.com/straight-tamago/misakaX"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "misakaX.app"

  zap trash: [
    "~/Library/Caches/com.34306.misakaX",
    "~/Library/HTTPStorages/com.34306.misakaX",
    "~/Library/Preferences/com.34306.misakaX.plist",
  ]
end
