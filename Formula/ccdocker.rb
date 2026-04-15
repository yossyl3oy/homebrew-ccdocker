class Ccdocker < Formula
  desc "Run Claude Code in Docker with profile management"
  homepage "https://github.com/yossyl3oy/ccdocker"
  version "0.5.0"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/yossyl3oy/ccdocker/releases/download/v0.5.0/ccdocker-v0.5.0-darwin-arm64.tar.gz"
  sha256 "4f1ed72c1498c57b3abd01b2739b6b56ac34f8ed9e7412187e3052dfffa0e2e8"

  def install
    libexec.install "ccdocker", "pty-proxy", "Dockerfile", "entrypoint.sh", ".dockerignore", "clipboard-shim.sh"
    bin.install_symlink libexec/"ccdocker"
  end

  test do
    assert_match "ccdocker", shell_output("#{bin}/ccdocker -v")
  end
end
