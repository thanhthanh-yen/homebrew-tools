require "formula"

class Griddb < Formula
  desc "Internet file retriever"
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/files/4959887/griddbduong.tar.gz"
  #sha256 "0189411e5d20f296301c589e23a56dfab4994342fad158dc62227e4126253c77"
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
    system "./client/c/bootstrap.sh", "--skip-po" if build.head?
    system "./client/c/configure"
    system "client/c/make"
  end

  test do
    assert_match "fed version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
