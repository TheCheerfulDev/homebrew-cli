class Symlinker < Formula
  desc "Make symlinking your dotfiles a breeze."
  homepage "https://github.com/thecheerfuldev/symlinker"
  license "Apache-2.0"
  version "1.0.0"

  head "https://github.com/thecheerfuldev/symlinker.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/1.0.0/symlinker-1.0.0-darwin-arm64.tar.gz"
      sha256 "78f5362e3c8a92fea269075422716c581782f66b49d923656f60a42135cc6c0b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/1.0.0/symlinker-1.0.0-darwin-amd64.tar.gz"
      sha256 "048ef2597e3661c0a40303b5af7b1872d0ff97ce22c2129fc2b412d2b5c00dfd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/1.0.0/symlinker-1.0.0-linux-arm64.tar.gz"
      sha256 "6bc5fa05799b82cc0a7a60110293b2f7271806c48a62a3178a35ff33a2bf2d0f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/1.0.0/symlinker-1.0.0-linux-amd64.tar.gz"
      sha256 "cec11d4bcc3c455ff43a4894efc64ca6939886aaa17088e92a4b757a3d92c07f"
    end
  end

  def install
    bin.install "symlinker"
  end
end
