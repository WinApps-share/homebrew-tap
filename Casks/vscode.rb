cask "vscode" do
  arch arm: "arm64", intel: "x64"

  version "1.142.0,6d62b1d5dace93a33b3a6d3eca1317bd5e15bcb1"
  sha256 arm:   "ac04774aeba3fd7110c92833d9195146d5086427bab2ca902200e7ad9f018a9e",
         intel: "de11c6fc9274a2e8a657b441ed65aea509fa2ecb708871d46f511553f56a9fb8"

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
