cask "cxasm-ndd" do
  version "3.9.0"
  sha256 "0bae362fc6d6c12629245130ec66221b3e626c634f5826f85c005acd81f5de83"

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
