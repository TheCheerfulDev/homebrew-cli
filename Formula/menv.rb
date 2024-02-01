class Menv < Formula
  desc "Manage your mvn configurations"
  homepage "https://github.com/thecheerfuldev/menv"
  license "Apache-2.0"
  version "0.9.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.0/menv-0.9.0-darwin-arm64.tar.gz"
      sha256 "9617ff492562e49efe38d76144e56fb01e52372e48e3b6fe6059612ce3612c23"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.0/menv-0.9.0-darwin-amd64.tar.gz"
      sha256 "3804625842ad0bac25b9bc21bde0de09fed8235c07ca387dda80e426b5ea3f06"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.0/menv-0.9.0-linux-arm64.tar.gz"
      sha256 "512bf39c4752c3164a988e63a4e3a247709ff5403f19e33daad9992de8ebda6c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.9.0/menv-0.9.0-linux-amd64.tar.gz"
      sha256 "a4d439e788c70864b0a4e332b7c0f857d76de4d1c6b430223c6f5dc7ccdbb2c3"
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
