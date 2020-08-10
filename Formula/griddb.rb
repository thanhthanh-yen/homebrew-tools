require "formula"

class Griddb < Formula
  desc "Internet file retriever"
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/files/5048938/griddb-c-macos.tar.gz"
  #sha256 "58ae51361580b3e466be477ab4bdcaaa86661f4064e074aaefbac94096ff82d8"
  version "1.0.0"
  
  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  depends_on "llvm"
  
  def install
    system "cd client/c; ./bootstrap.sh; ./configure; make"
  end

  test do
    assert_match "griddb version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
