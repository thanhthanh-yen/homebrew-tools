require "formula"

class Griddb < Formula
  desc "Internet file retriever"
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/releases/download/1.0.0/griddb-macos-installer-x64-4.5.0.pkg"
  sha256 "3b7930506d636ee4c684b5ec2206fed6c116523da8c6c827042dcd745c682260"
  version "1.0.0"
  # Homebrew requires tests.
  head do
    url "https://git.savannah.gnu.org/git/wget.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "xz" => :build
    depends_on "gettext"
  end
  def install
    system "./bootstrap" if build.head?
    system "./configure", "--prefix=#{prefix}"

    system "make"
  end

  test do
    assert_match "fed version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
