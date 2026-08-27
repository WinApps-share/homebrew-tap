cask "rapidefi" do
  arch arm: "arm64", intel: "x64"

  version "5.5.0"
  sha256 arm:   "e8053d3c7cc50cac0ec404adf6f36b3ad6c14976fc1c6f767d3d3d8e76724246",
         intel: "5c1a0a780cfa822b183530c21ce507e6ed6679921aaf2eef74c11b92add64c12"

  url "https://github.com/JeoJay127/RapidEFI-Tool/releases/download/v#{version}/RapidEFI-macOS-#{arch}.zip"
  name "RapidEFI"
  desc "Tool for managing EFI partitions"
  homepage "https://github.com/JeoJay127/RapidEFI-Tool"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "RapidEFI.app"

  zap trash: [
    "~/Library/Application Support/com.jeojay.rapidefi",
    "~/Library/Preferences/com.jeojay.rapidefi.plist",
  ]
end
