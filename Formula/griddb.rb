require "formula"

class Griddb < Formula
  desc "Internet file retriever"
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/files/5027062/griddb-c-client.tar.gz"
  sha256 "c2b75496198bd9c6505c942556c30f4839e930270d5064b9fff3a9ac0abce93e"
  version "1.0.0"
  head do
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "xz" => :build
    depends_on "gettext"
  end
    depends_on "pkg-config" => :build
    depends_on "libidn2"
    depends_on "openssl@1.1"
  on_linux do
    depends_on "util-linux"
  end
  
  def install
    system "cd client/c; ./bootstrap.sh; ./configure; make", "--skip-po" if build.head?
  end

  test do
    assert_match "griddb version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
