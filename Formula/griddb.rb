require "formula"

class Griddb < Formula
  desc "Internet file retriever"
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/files/5026154/duongntt_macos.tar.gz"
  sha256 "bc67ce84751129222f9c6fe7c27116f392ac33e48c4c123a3e835caed201f444"
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
    system "cd client/c"
    system "./bootstrap.sh", "--skip-po" if build.head?
    system "./configure"
    system "make"
  end

  test do
    assert_match "fed version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
