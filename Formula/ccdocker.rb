class Ccdocker < Formula
  desc "Run Claude Code in Docker with profile management"
  homepage "https://github.com/yossyl3oy/ccdocker"
  version "0.4.2"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/yossyl3oy/ccdocker/releases/download/v0.4.2/ccdocker-v0.4.2-darwin-arm64.tar.gz"
  sha256 "35e16d93ec468e345e90a4b6e589e66bd90403155a1091017418f5afcd1843f3"

  def install
    libexec.install "ccdocker", "pty-proxy", "Dockerfile", "entrypoint.sh", ".dockerignore", "clipboard-shim.sh"
    bin.install_symlink libexec/"ccdocker"
  end

  test do
    assert_match "ccdocker", shell_output("#{bin}/ccdocker -v")
  end
end
