class Menv < Formula
  desc "Manage your mvn configurations"
  homepage "https://github.com/thecheerfuldev/menv"
  license "Apache-2.0"
  version "0.8.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.8.0/menv-0.8.0-darwin-arm64.tar.gz"
      sha256 "da4870a640bbed9d16e8c3782e006f6cadc6a77a3146a4f81642af9d3cbb58bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.8.0/menv-0.8.0-darwin-amd64.tar.gz"
      sha256 "ef532e3b81d82445ebe705643b616cedc901043f175dce8334d1708b67d5d1b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.8.0/menv-0.8.0-linux-arm64.tar.gz"
      sha256 "03be110b8d081422a3280e6db6e4c3eb19801ef7c66bc675e345ca9ca423f8fa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.8.0/menv-0.8.0-linux-amd64.tar.gz"
      sha256 "f630bdf408d2d16546205b5557af463c4c3a46e40f547d095814e05a792dcada"
    end
  end

  def install
    bin.install "menv"
    bin.install "mvn"
  end

  def caveats
    <<~EOS
      To make use of menv, run the following commands:
    
        brew link --overwrite menv

      To uninstall menv, run the following commands:
        
        brew unlink menv > /dev/null
        brew unlink maven
        brew link maven

      To activate menv completion you need to add the following to your profile:
      
        source <(menv completion <zsh/bash/fish>)
    
      By default, menv will use vi to edit profiles. If you wish to change this, you can set the following environment variable:
        
        export MENV_EDITOR=<your editor of choice> # e.g. nano, emacs, etc.

    EOS
  end
end
