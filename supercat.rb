require 'formula'

class Supercat < Formula
  homepage 'http://supercat.nosredna.net'
  url 'http://supercat.nosredna.net/supercat-0.5.5.tar.gz'
  sha256 'c49bd0b72509a166fb8686c999169b2c970595bc565d0b0379a01323657c01bf'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--with-system-directory=#{prefix}/etc"
    system "make install"
  end
end
