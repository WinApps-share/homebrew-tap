cask "dsh-desktop" do
  version "2.0.22"
  sha256 "b5d1fd699ce9730021597d8049b29791fd7f66b3786b1c9a12ff493908cd97a1"

  url "https://github.com/anywhere-labs/dsh-desktop/releases/download/v#{version}-next/DSH-NEXT-#{version}-next-universal.dmg"
  name "DeepSeek Desktop"
  desc "第三方 DeepSeek Desktop 客户端"
  homepage "https://github.com/anywhere-labs/dsh-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "DSH NEXT.app"

  zap trash: "~/Library/Application Support/DSH NEXT"
end
