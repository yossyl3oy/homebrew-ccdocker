class Ccdocker < Formula
  desc "Run Claude Code in Docker with profile management"
  homepage "https://github.com/yossyl3oy/ccdocker"
  version "0.4.0"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/yossyl3oy/ccdocker/releases/download/v0.4.0/ccdocker-v0.4.0-darwin-arm64.tar.gz"
  sha256 "798b0dd786771a9dd77b3ddef15d2c233da2a3a6289e6f2065c25fe36474c251"

  def install
    libexec.install "ccdocker", "pty-proxy", "Dockerfile", "entrypoint.sh", ".dockerignore", "clipboard-shim.sh"
    bin.install_symlink libexec/"ccdocker"
  end

  test do
    assert_match "ccdocker", shell_output("#{bin}/ccdocker -v")
  end
end
