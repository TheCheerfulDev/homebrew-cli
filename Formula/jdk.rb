class Jdk < Formula
  desc "Manage your JDK installations with ease"
  homepage "https://github.com/thecheerfuldev/jdk-go"
  license "Apache-2.0"
  version "0.1.2"

  head "https://github.com/thecheerfuldev/jdk-go.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/jdk-go/releases/download/0.1.2/jdk-0.1.2-darwin-arm64.tar.gz"
      sha256 "164ad649825c973501492986d70d707dec033dc3d03050ddd668c4fcc858ebf3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/jdk-go/releases/download/0.1.2/jdk-0.1.2-darwin-amd64.tar.gz"
      sha256 "4ba02858dc57aed31bbc94fa0f7644f2bcbea7d9947fb7f9b676f372c1d6d60b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/jdk-go/releases/download/0.1.2/jdk-0.1.2-linux-arm64.tar.gz"
      sha256 "162e0b6700c972757679263a295823e8bc6652e29f1c72fa3d8582da17988652"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/jdk-go/releases/download/0.1.2/jdk-0.1.2-linux-amd64.tar.gz"
      sha256 "3d7be167c12211830195ca78f317249f7c8cf82741d912a319eaee4e32ed2762"
    end
  end

  def install
    bin.install "jdk"
  end

  # def caveats
  #   <<~EOS
  #     To make use of jdk-go, run the following commands:
  #
  #       brew link --overwrite jdk-go
  #
  #     To uninstall jdk-go, run the following commands:
  #
  #       brew unlink jdk-go > /dev/null
  #       brew unlink maven
  #       brew link maven
  #
  #     To activate jdk-go completion you need to add the following to your profile:
  #
  #       source <(jdk-go completion <zsh/bash/fish>)
  #
  #     By default, jdk-go will use vi to edit profiles. If you wish to change this, you can set the following environment variable:
  #
  #       export jdk-go_EDITOR=<your editor of choice> # e.g. nano, emacs, etc.
  #
  #   EOS
  # end
end
