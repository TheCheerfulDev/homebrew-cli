class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.1.1"

  head "https://github.com/thecheerfuldev/gitcd-go.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.1/gitcd-go-1.1.1-darwin-arm64.tar.gz"
      sha256 "3e9443e8edc72165a93dcc334f34c23b3dd8ffe34641dfc6825157328987ee21"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.1/gitcd-go-1.1.1-darwin-amd64.tar.gz"
      sha256 "892cf856a6ff1f7074ce0419f5499e2fd51b21ef687ab21c77b40c0cda8e1a16"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.1/gitcd-go-1.1.1-linux-arm64.tar.gz"
      sha256 "6c892951c73604b860fb1382920415130a008785b1457c309ea897718a401c15"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.1/gitcd-go-1.1.1-linux-amd64.tar.gz"
      sha256 "89097e02da1a208630f070a62b77bd77e4ee3ae6b62908a513c8c8f432d5e38c"
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
