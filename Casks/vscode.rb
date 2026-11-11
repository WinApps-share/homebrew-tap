cask "vscode" do
  arch arm: "arm64", intel: "x64"

  version "1.146.0,69047191fc427f2f92828279aae1d90d8eeda7ab"
  sha256 arm:   "0312d0f42f4d55ce872c9afcb64f182b70fa74c82d10b91c98ed22c12d992a63",
         intel: "94a051a6b1b712ba1e994023564cdf1c055636279fe45efbda7099e86cc6b22f"

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
