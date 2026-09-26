cask "dsh-desktop" do
  version "2.0.15"
  sha256 "b5a86914d5d2ae985030abdbeb03919110f4ec17b20e5c7dc37b9316bc3b5dc0"

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
