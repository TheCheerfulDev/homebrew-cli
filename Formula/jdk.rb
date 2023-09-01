class Jdk < Formula
  desc "Manage your Java environment"
  homepage "https://github.com/thecheerfuldev/jdk-wrapper"
  url "https://github.com/thecheerfuldev/jdk-wrapper/archive/2.0.2.tar.gz"
  sha256 "fb3cacdf9a71a2047fd46433c2ea2311e7b91f19c83ce7874ee44ec255b55bcb"
  license "Apache-2.0"

  head "https://github.com/thecheerfuldev/jdk-wrapper.git"

  def install
    bin.install "bin/jdk"
    libexec.install Dir["*"]
  end

#   def caveats
#       <<~EOS
#         To activate jenv, add the following to your #{shell_profile}:
#           export PATH="$HOME/.jenv/bin:$PATH"
#           eval "$(jenv init -)"
#       EOS
#   end

  test do
    shell_output("eval \"$(#{bin}/jenv init -)\" && jenv versions")
  end
end
