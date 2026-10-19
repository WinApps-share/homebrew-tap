cask "reqable" do
  arch arm: "arm64", intel: "x86_64"

  version "3.3.3"
  sha256 arm:   "24d406d1a9603a70a044806bf6ac085e8e10c84e1f259bef4aa1371cabc63ea7",
         intel: "a076cc23c644c964131bfa4094a6470c1dde3aa67284aeddb5f85769f879475b"

  url "https://github.com/reqable/reqable-app/releases/download/#{version}/reqable-app-macos-#{arch}.dmg",
      verified: "github.com/reqable/reqable-app/"
  name "Reqable"
  desc "Advanced API Debugging Proxy"
  homepage "https://reqable.com/"

  # Not every GitHub release provides a file for macOS
  # so we check multiple recent releases instead of only the "latest" release.
  livecheck do
    url :url
    regex(/^reqable[._-]app[._-]macos[._-]#{arch}\.dmg$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"] || release["prerelease"]

        release["assets"]&.map do |asset|
          match = asset["name"]&.match(regex)
          next if match.blank?

          release["tag_name"]&.[](/^v?(\d+(?:\.\d+)+)$/i, 1)
        end
      end.flatten
    end
  end

  auto_updates true
  depends_on :macos

  app "Reqable.app"

  uninstall_postflight_steps do
    delete_keychain_certificates "Reqable Proxy"
  end

  zap trash: [
    "~/Library/Application Support/com.reqable.macosx",
    "~/Library/Caches/Reqable",
    "~/Library/Preferences/com.reqable.macosx.plist",
  ]
end
