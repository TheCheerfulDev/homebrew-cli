class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.0.4"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.4/gitcd-go-1.0.4-darwin-arm64.tar.gz"
      sha256 "36e6f54e6e8dd137d4567dca2a4306e3724b0afd37f0fc6eac2a46fb1e269815"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.4/gitcd-go-1.0.4-darwin-amd64.tar.gz"
      sha256 "d0130e598e2de861421943a6df980384bea42656d52d614810476da61b963df0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.4/gitcd-go-1.0.4-linux-arm64.tar.gz"
      sha256 "372a827ebc050c73f7b8bf1528403dd575245048d9a859bc2648371f76e17893"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.4/gitcd-go-1.0.4-linux-amd64.tar.gz"
      sha256 "fad1f83fbb18bbaca24c58047338fea3c5907daa98eb5a4f78d42fb79af8d7c2"
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
