cask "dsh-desktop" do
  version "2.0.10"
  sha256 "f143c54726cf2f966187b82a4a48057a8b2884f46743390cf94650663433fb79"

  url "https://github.com/anywhere-labs/deepseek-harness-desktop/releases/download/v#{version}/DSH.Desktop-#{version}-universal.dmg"
  name "DeepSeek Desktop"
  desc "第三方 DeepSeek Desktop 客户端"
  homepage "https://github.com/anywhere-labs/deepseek-harness-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "DSH Desktop.app"

  zap trash: "~/Library/Application Support/DSH Desktop"
end
