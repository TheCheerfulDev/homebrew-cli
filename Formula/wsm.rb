class Wsm < Formula
  desc "Manage your terminal workspaces"
  homepage "https://github.com/thecheerfuldev/workspace-manager"
  url "https://github.com/thecheerfuldev/workspace-manager/archive/1.0.1.tar.gz"
  sha256 "aa3505b41a883becde59a8822d3382a73098070b2d31d6ea4dd93666b7487b0e"
  license "Apache-2.0"

  head "https://github.com/thecheerfuldev/workspace-manager.git"

  def install
    bin.install "bin/wsm"
    libexec.install Dir["*"]
  end

  def caveats
      <<~EOS
        To activate workspace-manager, add the following lines to your `.bashrc` or `.zshrc` file:

        export WSM_WORKSPACES_DIRECTORY="</path/to/wsm_workspaces_directory>"
        source <(workspace-manager sourcer)
        source <(workspace-manager completion)

        The `wsm_workspaces_directory` is the directory where you will store your workspaces.
        Use the following structure:

        wsm_workspaces_directory
                        /workspace1
                            /bin <--- this directory will be added to the PATH
                            /source-scripts <--- this directory will be sourced
                        /workspace2
                            /bin
                            /source-scripts
                        ...

      EOS
  end

#   test do
#     shell_output("eval \"$(#{bin}/jenv init -)\" && jenv versions")
#   end
end
