class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.0.6"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.6/gitcd-go-1.0.6-darwin-arm64.tar.gz"
      sha256 "1a921f970360c8469194433ae154f24311d53f90eddc30d52041782d5c23bb03"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.6/gitcd-go-1.0.6-darwin-amd64.tar.gz"
      sha256 "bd8586a8830cfc66f52303f5d33eba616f311c195c7e0ad707c64fb408c976f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.6/gitcd-go-1.0.6-linux-arm64.tar.gz"
      sha256 "34d0ce61b7aae6736a575e818f7ba46f2f884b3dfb5326442c4ed13daf699c55"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/1.0.6/gitcd-go-1.0.6-linux-amd64.tar.gz"
      sha256 "690b87b06b15ed339a31cd7b56051302b9857999fb77ee97d8a604fb7301135c"
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
