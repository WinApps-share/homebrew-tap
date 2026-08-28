cask "dsh-desktop" do
  version "2.0.4"
  sha256 "4b89bfe2794d8ac3248f09c78ac54f16f92cda40e3c7e2da7d1708a3b4ba7a33"

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
