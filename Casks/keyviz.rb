cask "keyviz" do
  version "2.1.1"
  sha256 "729700b4c738b74f52eeca6e8b0f1371de7c314861682bb3786d3b42e350d9bb"

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
