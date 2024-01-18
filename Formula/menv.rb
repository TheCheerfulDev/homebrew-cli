class Menv < Formula
  desc "Manage your mvn configurations"
  homepage "https://github.com/thecheerfuldev/menv"
  license "Apache-2.0"
  version "0.4.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.4.0/menv-0.4.0-darwin-arm64.tar.gz"
      sha256 "c99cb6aea96dd5ed83fe41276d503b14dfd7c6cdab106c592756049c55e3cdea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.4.0/menv-0.4.0-darwin-amd64.tar.gz"
      sha256 "b87e9f8c1f84d6bc51c40f03aef74e7377ace219fbba8767a052570fcf50eb2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.4.0/menv-0.4.0-linux-arm64.tar.gz"
      sha256 "50fd91dee11b043bb72295c4bacb352a690cb1d3be29c715508b6200427dfc24"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.4.0/menv-0.4.0-linux-amd64.tar.gz"
      sha256 "6c3d245fa453265223f15882497029baf0e317b7bc13e8eea46db8edfb5d2493"
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
