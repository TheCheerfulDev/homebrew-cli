class Menv < Formula
  desc "Manage your mvn configurations"
  homepage "https://github.com/thecheerfuldev/menv"
  license "Apache-2.0"
  version "0.5.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.5.0/menv-0.5.0-darwin-arm64.tar.gz"
      sha256 "e45de7fb80d3914b7d934efc38046a18535e62e2a80916550f333e04f616f1a0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.5.0/menv-0.5.0-darwin-amd64.tar.gz"
      sha256 "d6d31c6b96b406544d5c7de8bccfc1cc68b29cbb807e70cee644830ed3d4e4ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.5.0/menv-0.5.0-linux-arm64.tar.gz"
      sha256 "c7e36365b4c95f6d5ae87cb24c875858b52552b6e753229ac6979ad8e22c90e6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.5.0/menv-0.5.0-linux-amd64.tar.gz"
      sha256 "a6d8ff35ad25d8b21d2bfb67b81e59ebfa83cf288e1e7931c735fc39ba9f3096"
    end
  end

  def install
    bin.install "menv"
    bin.install "mvn"
  end

  def caveats
    <<~EOS
      To activate menv completion you need to add the following to your profile:
      
        source <(menv completion <zsh/bash/fish>)
    
      By default, menv will use vi to edit profiles. If you wish to change this, you can set the following environment variable:
        
        export MENV_EDITOR=<your editor of choice> # e.g. nano, emacs, etc.

    EOS
  end
end
