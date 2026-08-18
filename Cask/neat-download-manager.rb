# frozen_string_literal: true

cask "neat-download-manager" do
  version "1.3"
  sha256 "c0e301ee4b13504a76eb6c54846c9dcf6d8148d32489b4bb91bd2062d471ef81"

  url "https://www.neatdownloadmanager.com/file/NeatDMInstaller.dmg"
  name "Neat Download Manager"
  name "NDM"
  desc "Multi-threaded download manager"
  homepage "https://www.neatdownloadmanager.com/index.php"

  app "NeatDownloadManager.app"

  # 控制自动更新（brew bump-cask-pr / livecheck）的版本探测。
  # 官网下载文件名为固定值（NeatDMInstaller.dmg，不含版本号），无法从 URL 中提取版本，
  # 因此这里指定从下载页文本中匹配 Mac 版版本号。
  # 锚定到 NeatDMInstaller.dmg"> 以避开页头 JSON-LD 里同名但无版本的 downloadUrl，
  # 同时避免误匹配 Windows 安装包（NeatDM_setup.exe）的版本号。
  livecheck do
    url "https://www.neatdownloadmanager.com/index.php"
    regex(/NeatDMInstaller\.dmg">.*?ver[^0-9]*(\d+(?:\.\d+)+)/im)
  end

  zap trash: [
    "~/Library/Application Support/NeatDownloadManager",
    "~/Library/Preferences/com.NeatDownloadManager.plist",
  ]
end
