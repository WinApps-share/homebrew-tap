cask "reqable" do
  arch arm: "arm64", intel: "x86_64"

  version "3.3.11"
  sha256 arm:   "7455596d2013e87613265dd977a6d8e756ca20915718d3f5a8d6a2448f21b8e1",
         intel: "a560e37b452e19f5e5d4cd695b6e2c7acbbd042f71f918280255248f24f0eb8c"

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
