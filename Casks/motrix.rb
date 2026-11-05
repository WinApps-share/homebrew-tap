cask "motrix" do
  arch arm: "arm64", intel: "x64"

  version "2.3.0"
  sha256 arm:   "7c3d480c55e7e320eddbfe883b4815afcbd856c40764869e0e70d5a9e63b3bc3",
         intel: "dfac8a0a287293e1696835cb9da0c9fc8c502e619f6f31db5d47155f116d61a1"

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
