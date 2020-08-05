require "formula"

class Griddb < Formula
  desc "Internet file retriever"
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/files/5027062/griddb-c-client.tar.gz"
  #sha256 "bc67ce84751129222f9c6fe7c27116f392ac33e48c4c123a3e835caed201f444"
  version "1.0.0"
  # Homebrew requires tests.
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
    system "https://github.com/tungduong97/homebrew-tools/files/5027062/griddb-c-client.tar.gz"
    system "tar vxfz griddb-c-client.tar.gz"
    system "cd client/c; ./bootstrap.sh; ./configure; make"
  end

  test do
    assert_match "griddb version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
