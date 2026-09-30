cask "vscode" do
  arch arm: "arm64", intel: "x64"

  version "1.140.0,07f806f999227108933c2e30515b26eecc1fda74"
  sha256 arm:   "59cc77128b4e4551da0c97f0437fd61d3d0b2bc47d80c3b929c859368a39a1d3",
         intel: "f1b954bd9c7956ec17e45bded595dcf4e2371d332ebbd286f0336bb2f7175e05"

  url "https://vscode.download.prss.microsoft.com/dbazure/download/stable/#{version.csv.second}/VSCode-darwin-#{arch}.dmg"
  name "Microsoft Visual Studio Code"
  name "VS Code"
  desc "Open-source code editor"
  homepage "https://code.visualstudio.com/"

  livecheck do
    url "https://code.visualstudio.com/sha?build=stable"
    strategy :json do |json|
      item = json["products"]&.find do |item|
        item.dig("platform", "os") == "darwin-arm64-dmg"
      end
      next if item.blank?

      product_version = item["productVersion"]
      version = item["version"]
      next if product_version.blank? || version.blank?

      "#{product_version},#{version}"
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "Visual Studio Code.app"
  binary "#{appdir}/Visual Studio Code.app/Contents/Resources/app/bin/code"
  binary "#{appdir}/Visual Studio Code.app/Contents/Resources/app/bin/code-tunnel"

  uninstall launchctl: "com.microsoft.VSCode.ShipIt",
            quit:      "com.microsoft.VSCode"

  zap trash: [
    "~/.vscode",
    "~/Library/Application Support/Code",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.microsoft.vscode.sfl*",
    "~/Library/Caches/com.microsoft.VSCode",
    "~/Library/Caches/com.microsoft.VSCode.ShipIt",
    "~/Library/HTTPStorages/com.microsoft.VSCode",
    "~/Library/Preferences/ByHost/com.microsoft.VSCode.ShipIt.*.plist",
    "~/Library/Preferences/com.microsoft.VSCode.helper.plist",
    "~/Library/Preferences/com.microsoft.VSCode.plist",
    "~/Library/Saved Application State/com.microsoft.VSCode.savedState",
  ]
end
