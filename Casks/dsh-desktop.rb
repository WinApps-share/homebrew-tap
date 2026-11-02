cask "dsh-desktop" do
  version "2.0.21"
  sha256 "ec48040c1ac820805e6868f78a50dfa0bd89ea18ff77994b6302065700cff2dc"

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
