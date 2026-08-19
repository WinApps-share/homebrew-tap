cask "gui-for-clash" do
  arch arm: "arm64", intel: "amd64"

  version "1.26.1"
  sha256 arm:   "213968af455a999445c0cf69160abadd9822ee6815a6de120dc1417446dfdf10",
         intel: "1d549bf1d3da056bff58db930191328affa922cc41e10e62349cb79b3c8dcdcb"

  url "https://github.com/GUI-for-Cores/GUI.for.Clash/releases/download/v#{version}/GUI.for.Clash-darwin-#{arch}.zip"
  name "GUI for Clash"
  desc "跨平台的 Clash 图形界面客户端"
  homepage "https://github.com/GUI-for-Cores/GUI.for.Clash"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Info.plist 声明 LSMinimumSystemVersion 为 10.13，但 arm64 构建的 Mach-O 实际 minos 为 11.0（Big Sur），
  # 因此按两者中较严格的取 Big Sur。
  depends_on macos: :big_sur

  app "GUI.for.Clash.app"

  zap trash: "~/Library/Application Support/GUI.for.Clash"
end
