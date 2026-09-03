cask "dsh-desktop" do
  version "2.0.5"
  sha256 "3ab20c4d05c23ce08af5c6d5c8944eac24555278c9673a650d31603a57abd9b9"

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
