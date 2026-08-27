cask "dsh-desktop" do
  version "2.0.3"
  sha256 "9a5d4a51689baa7c24be7f11903f0ba9cfe4885a3241e573a1cc4134cd500329"

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
