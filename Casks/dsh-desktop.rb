cask "dsh-desktop" do
  version "2.0.1"
  sha256 "84debb8bf2642d82f0eb77c9f087b030db3b8b8672a0b7c3423c681f61738ff9"

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

  zap trash: [
    "~/Library/Application Support/DSH Desktop"
  ]
end
