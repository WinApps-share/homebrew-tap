cask "keyviz" do
  version "2.1.2"
  sha256 "86bd7afd9a0a310652fa6ac573798bfcec985637df22284eebb6f36a4e902cbe"

  url "https://github.com/mulaRahul/keyviz/releases/download/v#{version}/keyviz_#{version}_macos.dmg"
  name "Keyviz"
  desc "Visualize your keystrokes and mouse actions in real-time"
  homepage "https://github.com/mulaRahul/keyviz/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "keyviz.app"

  zap trash: [
    "~/Library/Application Support/org.keyviz",
    "~/Library/Caches/org.keyviz",
    "~/Library/WebKit/org.keyviz",
  ]
end
