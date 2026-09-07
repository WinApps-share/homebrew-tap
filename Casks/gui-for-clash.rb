cask "gui-for-clash" do
  arch arm: "arm64", intel: "amd64"

  version "1.27.0"
  sha256 arm:   "8c720083007cd60c45c1ebc65ba5677b03459945f10bd8c1ad033ca243e0381d",
         intel: "f163b998d4f03ab0f80cbd4332c706a9b8f50a9596f155fca8bc57043ca2456b"

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

  zap trash: [
    "~/Library/Application Support/GUI.for.Clash",
    "~/Library/Caches/com.wails.GUI.for.Clash",
    "~/Library/Preferences/com.wails.GUI.for.Clash.plist",
    "~/Library/WebKit/com.wails.GUI.for.Clash",
  ]
end
