class Ccdocker < Formula
  desc "Run Claude Code in Docker with profile management"
  homepage "https://github.com/yossyl3oy/ccdocker"
  version "0.1.0"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/yossyl3oy/ccdocker/releases/download/v0.1.0/ccdocker-v0.1.0-darwin-arm64.tar.gz"
  sha256 "1dec867978e8505920778e549f5c77965bf791360b52385c6ed5178196688867"

  def install
    libexec.install "ccdocker", "Dockerfile", "entrypoint.sh", ".dockerignore"
    bin.install_symlink libexec/"ccdocker"
  end

  test do
    assert_match "ccdocker", shell_output("#{bin}/ccdocker -v")
  end
end
