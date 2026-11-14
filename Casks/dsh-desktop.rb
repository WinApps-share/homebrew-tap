cask "dsh-desktop" do
  version "2.0.23"
  sha256 "15b3fcf5b0e042b3b44bdec49f45ae1f4af83c56867e44050d411bd972253e7c"

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
