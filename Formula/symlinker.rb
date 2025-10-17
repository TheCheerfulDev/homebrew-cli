class Gitcd < Formula
  desc "Make symlinking your dotfiles a breeze."
  homepage "https://github.com/thecheerfuldev/symlinker"
  license "Apache-2.0"
  version "0.1.0"

  head "https://github.com/thecheerfuldev/symlinker.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/0.1.0/symlinker-0.1.0-darwin-arm64.tar.gz"
      sha256 "bb4240f61829cdc1a5c0aed43625fdba1689ea75066027f2942e8b04fe37d6fe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/0.1.0/symlinker-0.1.0-darwin-amd64.tar.gz"
      sha256 "6f533b02a991882bdef9fcf90b76b9331c2e5fa8002fe19abbbd196514502721"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/0.1.0/symlinker-0.1.0-linux-arm64.tar.gz"
      sha256 "abdf3fd52421548f2117d05211aa7f69aefbdc7d07eea2e1672b078981f19e22"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/0.1.0/symlinker-0.1.0-linux-amd64.tar.gz"
      sha256 "d2117b647ab7c51b69e199e9d048404aae937f07a381380cc8f20a7517f79f04"
    end
  end

  def install
    bin.install "symlinker"
  end
end
