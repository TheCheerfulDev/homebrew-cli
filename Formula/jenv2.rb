class Jenv2 < Formula
  desc "Manage your Java environment"
  homepage "https://www.jenv.be/"
  url "https://github.com/thecheerfuldev/jenv/archive/1.0.0.tar.gz"
  sha256 "e848a413f5675443cc3ea28a4fa643a1138187ccaa5db1ce875b8c361b05bcdd"
  license "MIT"

  head "https://github.com/thecheerfuldev/jenv.git"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/jenv"
    fish_function.install_symlink Dir[libexec/"fish/*.fish"]
  end

  def caveats
    if preferred == :fish
      <<~EOS
        To activate jenv, run the following commands:
          echo 'status --is-interactive; and source (jenv init -|psub)' >> #{shell_profile}
      EOS
    else
      <<~EOS
        To activate jenv, add the following to your #{shell_profile}:
          export PATH="$HOME/.jenv/bin:$PATH"
          eval "$(jenv init -)"
      EOS
    end
  end

  test do
    shell_output("eval \"$(#{bin}/jenv init -)\" && jenv versions")
  end
end
