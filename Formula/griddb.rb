require "formula"

class Griddb < Formula
  homepage "https://github.com/tungduong97/homebrew-tools"
  version "1.0.0"
  def install
    system "wget https://github.com/tungduong97/homebrew-tools/releases/download/1.0.0/griddb-macos-installer-x64-4.5.0.pkg"
    system "sudo installer -pkg griddb-macos-installer-x64-4.5.0.pkg -target /"
  end
  # Homebrew requires tests.
  test do
    assert_match "fed version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end
