cask "cxasm-ndd" do
  version "3.9.2"
  sha256 "c14f34610610fbcdd65551c8648704924ef352d04246f65c519e3cb13afc325c"

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
