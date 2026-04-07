class Ccdocker < Formula
  desc "Run Claude Code in Docker with profile management"
  homepage "https://github.com/yossyl3oy/ccdocker"
  version "0.2.0"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/yossyl3oy/ccdocker/releases/download/v0.2.0/ccdocker-v0.2.0-darwin-arm64.tar.gz"
  sha256 "3cd16fb61076b4892986a6c594f74178ef303bee7786404dca8d99291eb9a1e1"

  def install
    libexec.install "ccdocker", "Dockerfile", "entrypoint.sh", ".dockerignore"
    bin.install_symlink libexec/"ccdocker"
  end

  test do
    assert_match "ccdocker", shell_output("#{bin}/ccdocker -v")
  end
end
