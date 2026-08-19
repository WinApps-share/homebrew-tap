class NM3u8dlRe < Formula
  desc "Cross-platform DASH/HLS/MSS downloader"
  homepage "https://github.com/nilaoda/N_m3u8DL-RE"
  version "0.6.0-beta"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+(?:-[0-9A-Za-z.-]+)?)$/i)
    strategy :github_latest
  end

  depends_on "ffmpeg"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}/N_m3u8DL-RE_v#{version}_osx-arm64_20260629.tar.gz"
      sha256 "ca181b7e8976564766c34e3cefe48fff409f58289ca970ade062668c01c53918"
    end

    on_intel do
      url "https://github.com/nilaoda/N_m3u8DL-RE/releases/download/v#{version}/N_m3u8DL-RE_v#{version}_osx-x64_20260629.tar.gz"
      sha256 "4dab8d256ae3164557f48a3326c8fa60da99e37536ee1589ce6c841180fa8204"
    end
  end

  def install
    bin.install "N_m3u8DL-RE"
  end

  test do
    assert_match version.to_s.delete_suffix("-beta"), shell_output("#{bin}/N_m3u8DL-RE --version")
  end
end
