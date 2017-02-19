require "formula"

class OpenResty < Formula
  homepage "https://openresty.org/"
  url "https://openresty.org/download/openresty-1.11.2.2.tar.gz"
  sha256 "7f9ca62cfa1e4aedf29df9169aed0395fd1b90de254139996e554367db4d5a01"
  version "1.11.2.2"

  depends_on "lua"
  depends_on "pcre"
  depends_on "openssl"
  depends_on "curl"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
