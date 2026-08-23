cask "todesk" do
  version "4.10.0.0"
  sha256 :no_check

  url "https://dl.todesk.com/macos/ToDesk_#{version}.pkg"
  name "ToDesk"
  desc "个人版远程控制软件"
  homepage "https://www.todesk.com/"

  livecheck do
    url "https://www.todesk.com/download"
    regex(/ToDesk[._-]v?(\d+(?:\.\d+)+)\.pkg/i)
  end

  depends_on formula: "wget"
  container type: :naked

  installer script: {
    executable: "/bin/bash",
    args:       [
      "-c",
      <<~EOS,
        set -e

        TMP_PKG="/tmp/ToDesk-#{version}.pkg"

        "#{HOMEBREW_PREFIX}/bin/wget" \
          --progress=bar:force \
          --user-agent="Mozilla/5.0" \
          --output-document="$TMP_PKG" \
          "https://dl.todesk.com/macos/ToDesk_#{version}.pkg"

        /usr/sbin/installer -pkg "$TMP_PKG" -target /

        rm -f "$TMP_PKG"
      EOS
    ],
    sudo:       true,
  }

  uninstall pkgutil: "com.youqu.todesk.mac",
            delete:  "/Applications/ToDesk.app"
end
