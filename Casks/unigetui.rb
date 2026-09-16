cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.3.0"
  sha256 arm:   "a0f8a9e48a0773c599b8f9866577203ca4c9b24f753e9e7f57c02b9d6cb03027",
         intel: "26baa55390b0f9587b141b1236f5cafdb7f969d0cf88217506db65028edfb8d7"

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
