class Jdk < Formula
  desc "Manage your Java environment"
  homepage "https://github.com/thecheerfuldev/jdk-wrapper"
  url "https://github.com/thecheerfuldev/jdk-wrapper/archive/2.0.1.tar.gz"
  sha256 "cd089da6534a6f087aa3754897b78270dfa78b1dca5a1f1076ba22c4761e4263"
  license "Apache-2.0"

  head "https://github.com/thecheerfuldev/jdk-wrapper.git"

  def install
    bin.install "bin/jdk"
    libexec.install Dir["*"]
  end

  def caveats
      <<~EOS
        To activate jenv, add the following to your #{shell_profile}:
          export PATH="$HOME/.jenv/bin:$PATH"
          eval "$(jenv init -)"
      EOS
  end

  test do
    shell_output("eval \"$(#{bin}/jenv init -)\" && jenv versions")
  end
end
