class Symlinker < Formula
  desc "Make symlinking your dotfiles a breeze."
  homepage "https://github.com/thecheerfuldev/symlinker"
  license "Apache-2.0"
  version "0.2.0"

  head "https://github.com/thecheerfuldev/symlinker.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/0.2.0/symlinker-0.2.0-darwin-arm64.tar.gz"
      sha256 "acd2c04ada226c8a6592329efe1438b3223afab3a38bb36023c28ec96dffe58f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/0.2.0/symlinker-0.2.0-darwin-amd64.tar.gz"
      sha256 "a01dc605d5c66922d7f8e54ef1d17ebbf2a4d87c30a5e1a2b69ee66594017dfc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/0.2.0/symlinker-0.2.0-linux-arm64.tar.gz"
      sha256 "588105ab2c9427a9b3f1645347c98991cbad4e280f5581995ac3f07c339c98df"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/symlinker/releases/download/0.2.0/symlinker-0.2.0-linux-amd64.tar.gz"
      sha256 "33fce302c20966042da9448ff01ef65a6c61faf995806a58375cfefb4ec31f15"
    end
  end

  def install
    bin.install "symlinker"
  end
end
