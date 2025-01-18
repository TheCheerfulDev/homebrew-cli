class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.0.8"

  head "https://github.com/thecheerfuldev/gitcd-go.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.8/gitcd-go-1.0.8-darwin-arm64.tar.gz"
      sha256 "ac0ba6546f2cc10eb018b1a6ff73a7f563e383e1e34e83a33ad6fdda3c30ff85"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.8/gitcd-go-1.0.8-darwin-amd64.tar.gz"
      sha256 "ff84f4c1c92efdc72aac059288278d837201937e0696661709150d2dceba870f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.8/gitcd-go-1.0.8-linux-arm64.tar.gz"
      sha256 "2dfc446d7d71e031d91f1cc46429c5f3303908444d479dbde26c8a788d01902e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.8/gitcd-go-1.0.8-linux-amd64.tar.gz"
      sha256 "49157599ecb64bdc4d72b12e836a0de41446d5aa714a015fe1a4a7717cf135d6"
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
