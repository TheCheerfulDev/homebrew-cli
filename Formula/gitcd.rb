class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.0.7"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.7/gitcd-go-1.0.7-darwin-arm64.tar.gz"
      sha256 "00e86acedce3c5096a219f44ed79502aae01fa0718d5ede58249a1f4ec82fc45"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.7/gitcd-go-1.0.7-darwin-amd64.tar.gz"
      sha256 "e1458d45b00bd7427b4fe661c57c394cba8553f9d6add9c5c9025f2e5ba45067"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.7/gitcd-go-1.0.7-linux-arm64.tar.gz"
      sha256 "32ecffa869f07dc263d929f215684fb1a706859e817bfa0ef2df729db72f1d50"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.7/gitcd-go-1.0.7-linux-amd64.tar.gz"
      sha256 "ed84f2f2926a3668ad2b1009c04b77c61c873f5afc4715b29fcd3f2df6e965dc"
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
