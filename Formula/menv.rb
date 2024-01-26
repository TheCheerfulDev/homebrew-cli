class Menv < Formula
  desc "Manage your mvn configurations"
  homepage "https://github.com/thecheerfuldev/menv"
  license "Apache-2.0"
  version "0.7.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.7.0/menv-0.7.0-darwin-arm64.tar.gz"
      sha256 "0dd639daddb4f7d45e1000992bdc088cfaaae11bcf20cdd431a529b120ab9334"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.7.0/menv-0.7.0-darwin-amd64.tar.gz"
      sha256 "beea411df7ec5b40617af22fa4187e2199b240034efbcc30f6d49b494cc510d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.7.0/menv-0.7.0-linux-arm64.tar.gz"
      sha256 "f25f32d083a31e6771d46f51da7affc283c9424dcb4e0d889417c3503b28a0bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.7.0/menv-0.7.0-linux-amd64.tar.gz"
      sha256 "26f6c738f5643d12d44a283c0732950af39a1af5245d69a94d705c52711e3713"
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
