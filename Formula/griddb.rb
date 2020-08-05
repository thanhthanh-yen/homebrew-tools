require "formula"

class Griddb < Formula
  desc "Internet file retriever"
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/files/5026607/griddb-c-client-4.3.1.tar.gz"
  sha256 "f4e0363f0084c2e2fdc1235080f1c12f8d677ad485a0970b123566d2bbb89047"
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
    bin.install "griddb"
  end

  test do
    assert_match "griddb version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
