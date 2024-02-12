class Menv < Formula
  desc "Manage your mvn configurations"
  homepage "https://github.com/thecheerfuldev/menv"
  license "Apache-2.0"
  version "0.9.1"

  head "https://github.com/thecheerfuldev/menv.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.1/menv-0.9.1-darwin-arm64.tar.gz"
      sha256 "2b339a8840c275aa502949bb0dce209c0340a0fd9c126f6bbb1d084e144739db"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.1/menv-0.9.1-darwin-amd64.tar.gz"
      sha256 "a9f528243b585756371bec6f648ba62ff6309bec4ae45b33fed9d629cff3a9b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.1/menv-0.9.1-linux-arm64.tar.gz"
      sha256 "9d2f1106f73fbc1790fd667856f1e2b8d0c527edffdd9307269c2ba1b0fe58a8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.1/menv-0.9.1-linux-amd64.tar.gz"
      sha256 "16e8b9ee8b5cd6e2dd0c8d9973f60ca6bf82fe44322fe6a66a0146138d5f9cd9"
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
