class Gitup < Formula
  homepage "https://github.com/earwig/git-repo-updater"
  url "https://github.com/earwig/git-repo-updater.git",
    :revision => "51a482d7a25bed39ccc75780813c65bd666c1436",
    :tag => "v0.2.3"

  depends_on :python if MacOS.version <= :snow_leopard

  resource "smmap" do
    url "https://pypi.python.org/packages/source/s/smmap/smmap-0.9.0.tar.gz"
    sha1 "2aad63033aab4e4cf1a3f75f521d985da8b1353f"
  end

  resource "colorama" do
    url "https://pypi.python.org/packages/source/c/colorama/colorama-0.3.3.tar.gz"
    sha1 "a8ee91adf4644bbdccfc73ead88f4cd0df7e3552"
  end

  resource "gitdb" do
    url "https://pypi.python.org/packages/source/g/gitdb/gitdb-0.6.4.tar.gz"
    sha1 "21cbba28199802e73e0c4a83b7c02369bbf8c7d7"
  end

  resource "GitPython" do
    url "https://pypi.python.org/packages/source/G/GitPython/GitPython-1.0.1.tar.gz"
    sha1 "e05cf761feba2b751aaf9bdad624abbe2e30e07d"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    %w[smmap colorama gitdb GitPython].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
end
