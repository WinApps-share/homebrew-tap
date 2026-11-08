cask "motrix" do
  arch arm: "arm64", intel: "x64"

  version "2.4.0"
  sha256 arm:   "626329c7f69ee959a7257c6c92029730972e52e21becadb50f1d092b6bf0df0d",
         intel: "484b867522ad7834d267d097008a00caa47f68b1fcd039b8aee7c1388beeb366"

  url "https://github.com/agalwood/Motrix/releases/download/v#{version}/Motrix-#{version}-#{arch}.dmg"
  name "Motrix"
  desc "Open-source download manager"
  homepage "https://motrix.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Motrix.app"

  zap trash: [
    "~/Library/Application Support/Motrix",
    "~/Library/Caches/app.motrix.native",
    "~/Library/Logs/Motrix",
    "~/Library/Preferences/app.motrix.native.plist",
    "~/Library/Saved Application State/app.motrix.native.savedState",
  ]
end
