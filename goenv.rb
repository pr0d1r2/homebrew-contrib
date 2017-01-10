require "formula"

class Goenv < Formula
  homepage "https://github.com/pwoolcoc/goenv"
  url "https://github.com/pwoolcoc/goenv/archive/1.0.tar.gz"
  sha256 "3ce9956f411d982cf8dc5d564b33899e70764679efc1fbcc3ac111cab2ba3f36"
  version "1.0"

  depends_on :python

  def install
    bin.install "goenv"
  end

end
