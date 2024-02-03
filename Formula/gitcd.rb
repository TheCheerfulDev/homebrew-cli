class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.0.2"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.2/gitcd-go-1.0.2-darwin-arm64.tar.gz"
      sha256 "13bfe3b0566ad60ed4a3cd09c258ccb7564702cbbc389f1a2315c25ee92ecced"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.2/gitcd-go-1.0.2-darwin-amd64.tar.gz"
      sha256 "5f143d539b58b8dd41c4d9845b0dc2a4ccb5058fa91426300876d87419d7dac9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.2/gitcd-go-1.0.2-linux-arm64.tar.gz"
      sha256 "30b46312675eb25516082edc47ef1963124655db0836fd65d6666dd86d00e1ff"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.2/gitcd-go-1.0.2-linux-amd64.tar.gz"
      sha256 "ab266ae4afc23c3a074e735672dc2c763c14877a94a5edd38cbc96d11caa2593"
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
