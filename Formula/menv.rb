class Menv < Formula
  desc "Manage your mvn configurations"
  homepage "https://github.com/thecheerfuldev/menv-go"
  license "Apache-2.0"
  version "0.1.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv-go/releases/download/0.1.0/menv-go-0.1.0-darwin-arm64.tar.gz"
      sha256 "9f6441299cb80e8eb9c541efa753ea691d3616e6050837d7edb7cdb47a0feebd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv-go/releases/download/0.1.0/menv-go-0.1.0-darwin-amd64.tar.gz"
      sha256 "d7114c76564a0635727eaa2186e23c533ff96eda2ae4ada35c1b0ef5a3d0a349"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/menv-go/releases/download/0.1.0/menv-go-0.1.0-linux-arm64.tar.gz"
      sha256 "85cb31644a77bee60f183eb5ba379c948ae906c1aa1ad2f74f2a30603e6c8a24"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/menv-go/releases/download/0.1.0/menv-go-0.1.0-linux-amd64.tar.gz"
      sha256 "44f833ee936a5db64fccf9393f4e6ea2f0e69e36601f9ecc5e5d9147d4f84533"
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
