require "formula"

class Griddb < Formula
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/releases/download/1.0.0/griddb-macos-installer-x64-4.5.0.pkg"
  sha256 "3b7930506d636ee4c684b5ec2206fed6c116523da8c6c827042dcd745c682260"
  version "1.0.0"
  # Homebrew requires tests.
  def install
    system "installer -pkg griddb-macos-installer-x64-4.5.0.pkg -target /usr/local"
  end

  test do
    assert_match "fed version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
