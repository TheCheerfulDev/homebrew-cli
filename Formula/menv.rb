class Menv < Formula
  desc "Manage your mvn configurations"
  homepage "https://github.com/thecheerfuldev/menv"
  license "Apache-2.0"
  version "0.6.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.6.0/menv-0.6.0-darwin-arm64.tar.gz"
      sha256 "2fd6b402a145f4b5c7c28dad201c65f6153f713fbd284ad1ced762d5ad7e64bf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.6.0/menv-0.6.0-darwin-amd64.tar.gz"
      sha256 "84d6c9ee43774d228a9e7f3e0a4129ace1a6ad0985d8220944ee1525abe1fedf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.6.0/menv-0.6.0-linux-arm64.tar.gz"
      sha256 "b4295bfde06222d42d52fbc4aca04e6af0b1f9a3ec4e9310d0e706aedf4967c3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.6.0/menv-0.6.0-linux-amd64.tar.gz"
      sha256 "c3945bf41cd077454099d4aeeb81f4b29c0d82dd83b494f04cfda3bfebe40b40"
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
