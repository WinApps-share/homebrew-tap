cask "vscode" do
  arch arm: "arm64", intel: "x64"

  version "1.136.1,a44adf7f53e00964ab890f9f8758a334f1fc15bc"
  sha256 arm:   "c6da3e125206cd215175fadc0c2d1fcd0478215953bb2e2d633dd6cfeecc5475",
         intel: "47fd10cdd5d464a83a75c0db01329223d464621bfbd7e08469015887c7e1eff0"

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
