class Gitup < Formula
  homepage "https://github.com/earwig/git-repo-updater"
  url "https://github.com/earwig/git-repo-updater.git",
    :revision => "51a482d7a25bed39ccc75780813c65bd666c1436"
  version "0.2.3"

  depends_on "python"

  def install
    ENV.prepend_create_path "PYTHONPATH", "#{lib}/python2.7/site-packages"
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
