cask "oc-auxiliary-tools" do
  version "20250001"
  sha256 "81526bda56348a25de119ce3cacf763e15bd8abc58c2ed5fb625ca698fd092fb"

  url "https://github.com/ic005k/OCAuxiliaryTools/releases/download/#{version}/OCAT_Mac.dmg"
  name "OCAuxiliaryTools"
  desc "Auxiliary tools for OpenCore bootloader"
  homepage "https://github.com/ic005k/OCAuxiliaryTools"

  livecheck do
    url "https://api.github.com/repos/ic005k/OCAuxiliaryTools/releases/latest"
    strategy :json do |json|
      json["tag_name"]
    end
  end

  depends_on :macos

  app "OCAuxiliaryTools.app"

  caveats do
    requires_rosetta
  end
end
