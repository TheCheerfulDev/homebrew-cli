class Menv < Formula
  desc "Manage your mvn configurations"
  homepage "https://github.com/thecheerfuldev/menv"
  license "Apache-2.0"
  version "0.9.3"

  head "https://github.com/thecheerfuldev/menv.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.3/menv-0.9.3-darwin-arm64.tar.gz"
      sha256 "98ae064df3deafc84f835a6c6c98bbbe9cccddb252348fbfb8f2dcf0aa799579"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.3/menv-0.9.3-darwin-amd64.tar.gz"
      sha256 "b37a8bc619d8d6a085cdf4a9160de422169d0b4552a50cf8d6678c12753749cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.3/menv-0.9.3-linux-arm64.tar.gz"
      sha256 "b8a93b96b8b7e8081620a37729e06fb413282a7e22c68ecbbbdb813ee993dd16"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.3/menv-0.9.3-linux-amd64.tar.gz"
      sha256 "f7b07c3485704bd17c23a8217e71d90cfa3abc069b21bda617fbdd35e595c974"
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
