class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.1.0"

  head "https://github.com/thecheerfuldev/gitcd-go.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.0/gitcd-go-1.1.0-darwin-arm64.tar.gz"
      sha256 "4027b0305f0246f98335aae23ef168301b8c18a29de910c61e1a6bbeacfb88d3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.0/gitcd-go-1.1.0-darwin-amd64.tar.gz"
      sha256 "0ee78ab0844f09c3ef92b9c6a161a87ccd510a97b1938c2b60518fb4fe6fd218"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.0/gitcd-go-1.1.0-linux-arm64.tar.gz"
      sha256 "5ad8454b761d22e9ec3eaac69bf85de7c76295a29cfaacd784ef78bdde4d3013"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.0/gitcd-go-1.1.0-linux-amd64.tar.gz"
      sha256 "48377189cbbd70cac745308777e068bd59b71785185f3b794d49fde95c72a008"
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

      If you wish to automate scanning for new projects, you can add the following cron job (or similar):
      0 7,12,15,20 * * * gcd --scan > /dev/null # scan for projects at 7am, 12pm, 3pm and 8pm

    EOS
  end
end
