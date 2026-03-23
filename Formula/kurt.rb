class Kurt < Formula
  desc "Kubernetes Unified Resource Tree (KURT) is a helpful tool for visualizing network resources on kubernetes"
  homepage "https://github.com/thecheerfuldev/kurt"
  license "Apache-2.0"
  version "0.1.0"

  head "https://github.com/thecheerfuldev/kurt.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/kurt/releases/download/0.1.0/kurt-0.1.0-darwin-arm64.tar.gz"
      sha256 "2b559a48184d170bc979d9771581237d85de93c14f408b88f7ae5586135fc5a5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/kurt/releases/download/0.1.0/kurt-0.1.0-darwin-amd64.tar.gz"
      sha256 "be2d40a887b73ba53704b234b8fc49703ea0f7aa95d2d4033a99d0562e8028c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/kurt/releases/download/0.1.0/kurt-0.1.0-linux-arm64.tar.gz"
      sha256 "07075a9d42e5af633459cf3d0fb7ccf32ea73fdff1c89396a11791785dd57409"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/kurt/releases/download/0.1.0/kurt-0.1.0-linux-amd64.tar.gz"
      sha256 "a0c1e86ee9833a56609d8e9e36499db2b5a63a24d3811648c1b6c97bc74c54f3"
    end
  end

  def install
    bin.install "kurt"
  end
end
