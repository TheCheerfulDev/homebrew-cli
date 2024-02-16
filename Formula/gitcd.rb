class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.0.3"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.3/gitcd-go-1.0.3-darwin-arm64.tar.gz"
      sha256 "c963d20c0143fe21478169bc02cf4e9116033303b56a8938c9e7321ecbb193fa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.3/gitcd-go-1.0.3-darwin-amd64.tar.gz"
      sha256 "cf7cb355387fd75fefcc0355b363a07cfadd8266186f78df0ef8c1fb314b8ec9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.3/gitcd-go-1.0.3-linux-arm64.tar.gz"
      sha256 "69b769a77b071af4b7458b0e95ef7a08d259463baa87911b02a668628728d50f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.3/gitcd-go-1.0.3-linux-amd64.tar.gz"
      sha256 "7f44d13194d9df2791a41694c45140000256e4e98896cbdbd99136a88f7cbd78"
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
