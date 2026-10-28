cask "reqable" do
  arch arm: "arm64", intel: "x86_64"

  version "3.3.6"
  sha256 arm:   "8dc065d266623c6e7c455c5d46044b5312d4b3d3f87836d202069b9d729f06cd",
         intel: "bd2cefb0c6b0a4ea3387d5e6a809436465e278318fb559782dcd357358c70e14"

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
