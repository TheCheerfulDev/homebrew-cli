class Symlinker < Formula
  desc "Make symlinking your dotfiles a breeze."
  homepage "https://github.com/thecheerfuldev/symlinker"
  license "Apache-2.0"
  version "1.0.1"

  head "https://github.com/thecheerfuldev/symlinker.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/1.0.1/symlinker-1.0.1-darwin-arm64.tar.gz"
      sha256 "cb01c635eab6c514f7163f76c4db60056b42519877a7106fc40b9eafbe1465e9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/1.0.1/symlinker-1.0.1-darwin-amd64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/1.0.1/symlinker-1.0.1-linux-arm64.tar.gz"
      sha256 "d11b575ecfb7f8de7485d7844d3057fb163913d8f8471bb27130a3462d3a7f8c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/1.0.1/symlinker-1.0.1-linux-amd64.tar.gz"
      sha256 "8ae54525068d46a757a60acb848e76a71d807c8b9e65fc2cb7391e40052d2480"
    end
  end

  def install
    bin.install "symlinker"
  end
end
