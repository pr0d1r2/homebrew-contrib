require "formula"

class LuaRocks < Formula
  homepage "https://luarocks.org/"
  url "http://luarocks.github.io/luarocks/releases/luarocks-2.4.2.tar.gz"
  sha256 "0e1ec34583e1b265e0fbafb64c8bd348705ad403fe85967fd05d3a659f74d2e5"
  version "2.4.2"

  depends_on "lua"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
