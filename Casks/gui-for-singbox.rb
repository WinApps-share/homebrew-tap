cask "gui-for-singbox" do
  arch arm: "arm64", intel: "amd64"

  version "1.26.1"
  sha256 arm:   "7936eccdff28316599370ab0bf174516a6cde1ecda936e52b6e1adcaac0d4a52",
         intel: "5a489b243c1259a047ce6e7d6d483a7c250cb84b696db2a69ee7c95d0d854b07"

  url "https://github.com/GUI-for-Cores/GUI.for.SingBox/releases/download/v#{version}/GUI.for.SingBox-darwin-#{arch}.zip"
  name "GUI for SingBox"
  desc "跨平台的 singbox 图形界面客户端"
  homepage "https://github.com/GUI-for-Cores/GUI.for.SingBox"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Info.plist 声明 LSMinimumSystemVersion 为 10.13，但 arm64 构建的 Mach-O 实际 minos 为 11.0（Big Sur），
  # 因此按两者中较严格的取 Big Sur。
  depends_on macos: :big_sur

  app "GUI.for.SingBox.app"

  zap trash: [
    "~/Library/Application Support/GUI.for.SingBox",
    "~/Library/Caches/com.wails.GUI.for.SingBox",
    "~/Library/Preferences/com.wails.GUI.for.SingBox.plist",
    "~/Library/WebKit/com.wails.GUI.for.SingBox",
  ]
end
