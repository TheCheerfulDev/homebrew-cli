class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "0.2.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.2.0/gitcd-go-0.2.0-darwin-arm64.tar.gz"
      sha256 "83f0209b5fdedafddba2ffa93488d6de2062971465413ce41edf8ac60e30ed0a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.2.0/gitcd-go-0.2.0-darwin-amd64.tar.gz"
      sha256 "ad668b6192bc7d78156a1c9bce01057836c3da96ad7c1524adff50bbd800ea89"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.2.0/gitcd-go-0.2.0-linux-arm64.tar.gz"
      sha256 "2d3201c952da07df0bcaf08018883430ba520169b1da32b53fb9ba850aa7dd4d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.2.0/gitcd-go-0.2.0-linux-amd64.tar.gz"
      sha256 "23055961e69fe0981967dd860897c56690850b030e5062e1470c2d1dcc79834a"
    end
  end

  def install
    bin.install "gitcd-go"
    bin.install "gitcd-go-runner.sh"
  end

  def caveats
    <<~EOS
      To activate gitcd you need to add the following to your profile:
      
      export GITCD_PROJECT_HOME=<your root projects folder here>
      alias gcd="source gitcd-go-runner.sh"

      OR pick any alias that you prefer :)

      NOTE: If GITCD_PROJECT_HOME is NOT set, your home directory will be used instead.

    EOS
  end
end
