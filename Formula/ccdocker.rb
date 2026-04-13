class Ccdocker < Formula
  desc "Run Claude Code in Docker with profile management"
  homepage "https://github.com/yossyl3oy/ccdocker"
  version "0.3.2"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/yossyl3oy/ccdocker/releases/download/v0.3.2/ccdocker-v0.3.2-darwin-arm64.tar.gz"
  sha256 "c1f4874a91f0ff2ed6fd5e3221b5adf1f4d2a0cbf60a49041bf05cb7c4ea746d"

  def install
    libexec.install "ccdocker", "pty-proxy", "Dockerfile", "entrypoint.sh", ".dockerignore", "clipboard-shim.sh"
    bin.install_symlink libexec/"ccdocker"
  end

  test do
    assert_match "ccdocker", shell_output("#{bin}/ccdocker -v")
  end
end
