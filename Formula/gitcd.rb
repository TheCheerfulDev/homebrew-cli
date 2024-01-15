class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "0.1.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.1.0/gitcd-go-0.1.0-darwin-arm64.tar.gz"
      sha256 "e884b0f384cf77ea27ac3d2259dcd2c0c38df3da3298b97ec2f877fa401733b1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.1.0/gitcd-go-0.1.0-darwin-amd64.tar.gz"
      sha256 "acbc8aff46729d43314f7dd8bf43ddba23f1788278eec8cab695e03167a50683"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.1.0/gitcd-go-0.1.0-linux-arm64.tar.gz"
      sha256 "708d7372c9971d87e93cc359b84c919e47e10cfa9f53a5e3cfa2677906195114"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.1.0/gitcd-go-0.1.0-linux-amd64.tar.gz"
      sha256 "e6b212ca569d7b00805c90e94d37ff846531bfce7cb4695c506cb470b85f7f19"
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
      alias gitcd="source $(which gitcd-go-runner.sh)"

      OR pick any alias that you prefer :)

    EOS
  end

  #   test do
  #     shell_output("eval \"$(#{bin}/jenv init -)\" && jenv versions")
  #   end
end
