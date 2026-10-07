cask "vscode" do
  arch arm: "arm64", intel: "x64"

  version "1.141.0,2a59476c9bfcb90b3ddc372c36762471b7dfad1c"
  sha256 arm:   "ab0ecc74855d5d38e898605234bc033b27b79f202e6f12a11442fc410ae06561",
         intel: "9cf3e6a75cdcf0258eab078c70bce371c96dc04cae3adbbe24ece8f9d401bd69"

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
