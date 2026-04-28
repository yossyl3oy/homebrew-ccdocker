class Ccdocker < Formula
  desc "Run Claude Code in Docker with profile management"
  homepage "https://github.com/yossyl3oy/ccdocker"
  version "0.5.2"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/yossyl3oy/ccdocker/releases/download/v0.5.2/ccdocker-v0.5.2-darwin-arm64.tar.gz"
  sha256 "fd400ed372396142d4f6ae194f256f46799c09cea1700644db86c07ddd469a23"

  def install
    libexec.install "ccdocker", "pty-proxy", "Dockerfile", "entrypoint.sh", ".dockerignore", "clipboard-shim.sh"
    bin.install_symlink libexec/"ccdocker"
  end

  test do
    assert_match "ccdocker", shell_output("#{bin}/ccdocker -v")
  end
end
