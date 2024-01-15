class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "1.0.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.0.5/gitcd-go-0.0.5-darwin-arm64.tar.gz"
      sha256 "f1669733245e2badbc6a10d4fa15e9619ef7f1434b62096a8b6d44adc2cf5b0e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.0.5/gitcd-go-0.0.5-darwin-amd64.tar.gz"
      sha256 "d9969013e84e549bae888b2025b16cef240840b3ea2a61676ce8a22411e17751"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.0.5/gitcd-go-0.0.5-linux-arm64.tar.gz"
      sha256 "eca7fafceca46d9a81e7f8f20d52c34a4558c2c8a8ecf4dafb93354d427cf0ed"
    end
    if Hardware::CPU.intel?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.0.5/gitcd-go-0.0.5-linux-amd64.tar.gz"
      sha256 "d9969013e84e549bae888b2025b16cef240840b3ea2a61676ce8a22411e17751"
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

    EOS
  end

  #   test do
  #     shell_output("eval \"$(#{bin}/jenv init -)\" && jenv versions")
  #   end
end
