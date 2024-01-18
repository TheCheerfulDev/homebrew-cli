class Menv < Formula
  desc "Manage your mvn configurations"
  homepage "https://github.com/thecheerfuldev/menv"
  license "Apache-2.0"
  version "0.3.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.3.0/menv-0.3.0-darwin-arm64.tar.gz"
      sha256 "292ea466ec9c662d4aad1f1b94d37f9d479a3e419671d981d4805dfd7989bc04"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.3.0/menv-0.3.0-darwin-amd64.tar.gz"
      sha256 "a54af4b05a541a049fb9e77e8da11dd4d844590c5eed80ccbba20d33d35e6090"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.3.0/menv-0.3.0-linux-arm64.tar.gz"
      sha256 "b5fe47e4a0419bfe880de0f6f08c9e94fdbc1cd993fca75c4037f47211bd7103"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv/releases/download/0.3.0/menv-0.3.0-linux-amd64.tar.gz"
      sha256 "6c353e812acfe123e4e3b5f5383fd3b0fbfb6aea0e786d3aa7017e37a1952b02"
    end
  end

  def install
    bin.install "menv"
    bin.install "mvn"
  end

  # def caveats
  #   <<~EOS
  #     To activate gitcd you need to add the following to your profile:
  #
  #     export GITCD_PROJECT_HOME=<your root projects folder here>
  #     alias gcd="source gitcd-go-runner.sh"
  #
  #     OR pick any alias that you prefer :)
  #
  #     NOTE: If GITCD_PROJECT_HOME is NOT set, your home directory will be used instead.
  #
  #     If you wish to automate scanning for new projects, you can add the following cron job (or similar):
  #     0 7,12,15,20 * * * gcd --scan > /dev/null # scan for projects at 7am, 12pm, 3pm and 8pm
  #
  #   EOS
  # end
end
