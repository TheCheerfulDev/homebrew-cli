class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.1.2"

  head "https://github.com/thecheerfuldev/gitcd-go.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.2/gitcd-go-1.1.2-darwin-arm64.tar.gz"
      sha256 "dfe5d73203aa78563c1ed1b596228995c22863350714decf650820f771e97609"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.2/gitcd-go-1.1.2-darwin-amd64.tar.gz"
      sha256 "c2d541edeee51a843e6e4b7a5d257abc24b2bb09e28a0ce1449bbdb31db68035"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.2/gitcd-go-1.1.2-linux-arm64.tar.gz"
      sha256 "f279dbf83b3a60af716148d771599a87dfd8c94ee9eb685ac052c1d0bd4f859d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.1.2/gitcd-go-1.1.2-linux-amd64.tar.gz"
      sha256 "73e6a490293041116b022c27c94a3fc7821d987a525639f9e25398706c18b6ee"
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
