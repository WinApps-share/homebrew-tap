cask "dsh-desktop" do
  version "2.0.18"
  sha256 "a3aad3ac11ba3cd6cbf295809a32fff907152332800a21a0910034ba95379f08"

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
