cask "cxasm-ndd" do
  version "3.8.3"
  sha256 "6ef1c4f91a13c8fcaec21d0be47cce788019e57b4bd52b37f053df9dce0a494a"

  url "https://gitee.com/cxasm/notepad--/releases/download/v#{version}/Notepad--v#{version}-mac_arm64_12.3.dmg"
  name "Notepad--"
  desc "轻量级文本编辑器"
  homepage "https://gitee.com/cxasm/notepad--"

  livecheck do
    url "https://gitee.com/api/v5/repos/cxasm/notepad--/releases/latest"
    strategy :json do |json|
      json["tag_name"]&.delete_prefix("v")
    end
  end

  depends_on macos: :ventura

  app "Notepad--.app"
end
