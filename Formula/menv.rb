class Menv < Formula
  desc "Manage your mvn configurations"
  homepage "https://github.com/thecheerfuldev/menv"
  license "Apache-2.0"
  version "0.9.2"

  head "https://github.com/thecheerfuldev/menv.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.2/menv-0.9.2-darwin-arm64.tar.gz"
      sha256 "06eb564225a7e0e36ac6c804adc1057eefbd04e5f742c95352c501362ab443fc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.2/menv-0.9.2-darwin-amd64.tar.gz"
      sha256 "0d6a30d78179d237f125b93cc6d8be6b47edfdf33c3240294e833ac2a62098b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.2/menv-0.9.2-linux-arm64.tar.gz"
      sha256 "46d28a2aaabbb12028ac66b6cde51ca6f59d57eeb09d71b4379e4d9bb445f057"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.2/menv-0.9.2-linux-amd64.tar.gz"
      sha256 "666a3fce15775682d6e0068eede326c567dca82e3844c9caae9e29d0f96d8b68"
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
