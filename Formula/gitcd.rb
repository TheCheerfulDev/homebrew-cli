class Gitcd < Formula
  desc "Index and navigate to your git projects"
  homepage "https://github.com/thecheerfuldev/gitcd-go"
  license "Apache-2.0"
  version "0.0.6"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/TheCheerfulDev/gitcd-go/releases/download/0.0.6/gitcd-go-0.0.6-darwin-arm64.tar.gz"
      sha256 "f2f07dff543959d6690063d9db7b395239aefd0a6f6964cb6052e24b23b3ee70"
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

      OR pick any alias that you prefer :)

    EOS
  end

  #   test do
  #     shell_output("eval \"$(#{bin}/jenv init -)\" && jenv versions")
  #   end
end
