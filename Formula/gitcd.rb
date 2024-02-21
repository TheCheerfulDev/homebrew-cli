class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.0.5"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.5/gitcd-go-1.0.5-darwin-arm64.tar.gz"
      sha256 "1cdc23981cb571857fbf6cb2d91f11199b28e27aae6fa3cb0a4cdb25a91339a4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.5/gitcd-go-1.0.5-darwin-amd64.tar.gz"
      sha256 "4f5245c7e9f875c48a6fc5b0a1fae66761e667d1f6ed6026e5cce939aee8a9e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.5/gitcd-go-1.0.5-linux-arm64.tar.gz"
      sha256 "4faddf329313b4be54d88629a4650a22d78613d5eabb9f0253347b472315a91c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.5/gitcd-go-1.0.5-linux-amd64.tar.gz"
      sha256 "04bbec0e440a7625698aedb5339b2bd7c9ccdfe3d1eea1a5ec542c4e6eb6ce82"
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
