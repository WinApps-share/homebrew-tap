cask "dsh-desktop" do
  version "2.0.14"
  sha256 "cb0efc674a823bb57c97e07cfd57adc3139fe1e1a9df6aad0609c2a97458b462"

  url "https://github.com/anywhere-labs/deepseek-harness-desktop/releases/download/v#{version}/DSH.Desktop-#{version}-universal.dmg"
  name "DeepSeek Desktop"
  desc "第三方 DeepSeek Desktop 客户端"
  homepage "https://github.com/anywhere-labs/deepseek-harness-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "DSH Desktop.app"

  zap trash: "~/Library/Application Support/DSH Desktop"
end
