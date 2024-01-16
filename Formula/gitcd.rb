class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.0.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.0/gitcd-go-1.0.0-darwin-arm64.tar.gz"
      sha256 "edd53b7a558bde9636af7859c2a0a8001140a53639c3f90e870210e13127be98"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.0/gitcd-go-1.0.0-darwin-amd64.tar.gz"
      sha256 "1ab24162c9eaa5b72e8a4608198968f3f62d7aeef5c95ae9255f62f7336f841d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.0/gitcd-go-1.0.0-linux-arm64.tar.gz"
      sha256 "24b27234c5bdc1ce8786b6af79074478576e5f598d32ee9d9ed220ebec5433fa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.0/gitcd-go-1.0.0-linux-amd64.tar.gz"
      sha256 "3d9c6da36b60e1515bd39197cb9259acf6412f3a8f98cf703365cfc49208dbe8"
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
