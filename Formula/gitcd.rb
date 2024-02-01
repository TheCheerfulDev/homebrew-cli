class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.0.1"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.1/gitcd-go-1.0.1-darwin-arm64.tar.gz"
      sha256 "462930c37c501badc5337a4d1b301b42354c383572834995555d7683957d2150"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.1/gitcd-go-1.0.1-darwin-amd64.tar.gz"
      sha256 "47c72cbe60fd6217ace08d92fb3e3f929f4ffd4d63d46648b1db93d680b28fe4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.1/gitcd-go-1.0.1-linux-arm64.tar.gz"
      sha256 "f81fe2e08add1fcfd2db0c1df849462534d0f2e33d6c15821bae0ae18853af1b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.1/gitcd-go-1.0.1-linux-amd64.tar.gz"
      sha256 "e88b1ed03077d7ed440d0b400438f89d0f4790600cfa9abf134622efbfe6880e"
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
