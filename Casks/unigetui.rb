cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.3.2"
  sha256 arm:   "9ca28c8484a83cf49cb9b1b01b9a3be45d55acb2fb0828153a27d25b78112761",
         intel: "594f9565bd98053487e2bcd49d8578cbb4726e5c5c6daa4465e6115cc8e66cc6"

  url "https://github.com/Devolutions/UniGetUI/releases/download/v#{version}/UniGetUI.macos-#{arch}.dmg",
      verified: "github.com/Devolutions/UniGetUI/"
  name "UniGetUI"
  desc "Graphical Interface for your package managers"
  homepage "https://devolutions.net/unigetui/"

  depends_on macos: :monterey

  app "UniGetUI.app"

  zap trash: [
    "~/Library/Application Support/UniGetUI",
    "~/Library/Preferences/io.github.marticliment.unigetui.plist",
  ]
end
