class Py2app < Formula
  homepage "https://pypi.python.org/pypi/py2app/"
  url "https://pypi.python.org/packages/source/p/py2app/py2app-0.9.tar.gz"
  sha256 '7922672f9e99b50ed931780d43405ac134988b1532dd0659ef130b824f88c59d'

  version "0.9"

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    ENV.prepend_create_path "PYTHONPATH", "#{lib}/python2.7/site-packages"
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
