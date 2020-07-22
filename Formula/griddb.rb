require "formula"

class Griddb < Formula
  desc "Internet file retriever"
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/files/4959623/griddbduong.tar.gz"
  #sha256 "3b7930506d636ee4c684b5ec2206fed6c116523da8c6c827042dcd745c682260"
  sha256 "0189411e5d20f296301c589e23a56dfab4994342fad158dc62227e4126253c77"
  version "1.0.0"
  # Homebrew requires tests.
  def install
    system "cd client/c/", "./bootstrap.sh"
    system "./configure"
    system "make"
  end

  test do
    assert_match "fed version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
