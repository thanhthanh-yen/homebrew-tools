require "formula"

class Griddb < Formula
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/files/4952591/scrip.tar.gz"
  sha256 "2ca4d6ff465ee6848cc70a84f0461133edbbc765"

  def install
    system "./basr.sh"
  end
  # Homebrew requires tests.
  test do
    assert_match "fed version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
