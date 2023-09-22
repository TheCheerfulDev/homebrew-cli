class Jdk < Formula
  desc "Manage your Java environment"
  homepage "https://github.com/thecheerfuldev/jdk-wrapper"
  url "https://github.com/thecheerfuldev/jdk-wrapper/archive/2.0.3.tar.gz"
  sha256 "4fcfdb80efcb269f070dd17c7b28f9f35b4652bffcaa3e215360e1a42a79de2c"
  license "Apache-2.0"

  head "https://github.com/thecheerfuldev/jdk-wrapper.git"

  def install
    bin.install "bin/jdk"
    libexec.install Dir["*"]
  end
end
