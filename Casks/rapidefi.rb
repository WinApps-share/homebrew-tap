cask "rapidefi" do
  arch arm: "arm64", intel: "x64"

  version "5.4.0"
  sha256 arm:   "1526954e513890981ab4a279bebb2a558990a8d509461a8b8ec56b60ddd1517b",
         intel: "5a91917530888ce0330b90e04c071aedfaf04d53beba78ac3e8378f1b735f811"

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
