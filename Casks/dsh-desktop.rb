cask "dsh-desktop" do
  version "2.0.13"
  sha256 "14dca10647c5f0ccf39433239134995998ab7b5d34aa179570b8fac0b8569363"

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
