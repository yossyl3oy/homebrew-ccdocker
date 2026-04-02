class Ccdocker < Formula
  desc "Run Claude Code in Docker with profile management"
  homepage "https://github.com/yossyl3oy/ccdocker"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yossyl3oy/ccdocker/releases/download/v0.1.0/ccdocker-v0.1.0-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/yossyl3oy/ccdocker/releases/download/v0.1.0/ccdocker-v0.1.0-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    libexec.install "ccdocker", "Dockerfile", "entrypoint.sh", ".dockerignore"
    bin.install_symlink libexec/"ccdocker"
  end

  test do
    assert_match "ccdocker", shell_output("#{bin}/ccdocker -v")
  end
end
