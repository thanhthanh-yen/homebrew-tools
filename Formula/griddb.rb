require "formula"

class Griddb < Formula
  homepage "https://github.com/tungduong97/homebrew-tools"
  system "/bin/bash -c curl -fsSL https://github.com/tungduong97/homebrew-tools/blob/master/basr.sh "
  version "1.0.0"
  def install
    bin.install "griddb"
  end
  # Homebrew requires tests.
  test do
    assert_match "fed version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
