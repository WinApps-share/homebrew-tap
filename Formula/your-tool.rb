# 这是一个 Formula 模板：用于安装你自己的 CLI 工具（源码构建）。
#
# 使用方式：把此文件复制为 Formula/<your-tool>.rb，按需修改，或直接运行：
#   brew create <下载地址.tar.gz> --tap <user>/tap --set-name <user>-<tool>
#
# 完整参考：
#   https://docs.brew.sh/Formula-Cookbook

class YourTool < Formula
  desc "一句话描述这个工具是干什么的"
  homepage "https://example.com/your-tool"
  url "https://example.com/your-tool-1.0.0.tar.gz"
  sha256 "用 brew 或 shasum -a 256 计算出的 64 位十六进制哈希"
  license "MIT"
  version "1.0.0"

  # 依赖示例（按需启用）：
  # depends_on "cmake" => :build
  # depends_on "go" => :build
  # depends_on "libtool"

  def install
    # 常见的几种构建/安装方式，按你的项目选一种：

    # Go 项目：
    # system "go", "build", *std_go_args(output: bin/"your-tool", ldflags: "-s -w")

    # Rust 项目（用 cargo）：
    # system "cargo", "install", *std_cargo_args

    # C/C++ / Autotools 项目：
    # system "./configure", "--prefix=#{prefix}"
    # system "make"
    # system "make", "install"
  end

  test do
    # 简单验证安装是否成功（避免为空导致审计失败）：
    system "#{bin}/your-tool", "--version"
  end
end
