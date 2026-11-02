cask "rapidefi" do
  version "5.8.0"
  sha256 "9d00a7605ae4fd2b707c9ce4afa747b14e88f480af2135dc57a0a6a2ad95d33c"

  url "https://github.com/JeoJay127/RapidEFI-Tool/releases/download/v#{version}/RapidEFI-macOS-universal.zip"
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
