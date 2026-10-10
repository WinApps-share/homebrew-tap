cask "cxasm-ndd" do
  version "3.9.1"
  sha256 "23fa0c5fe6d0fb77ac931295e490633566ed41eccb94b3fd15017f1957b4b481"

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
