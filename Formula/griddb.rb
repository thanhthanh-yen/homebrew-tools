require "formula"

class Griddb < Formula
  desc "Internet file retriever"
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/files/5049101/tungduong.tar.gz"
  #sha256 "669966284f7ad7a74ea24c31050ed3895fc1a3b59c3b1498d67f464a5a9afb2d"
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
