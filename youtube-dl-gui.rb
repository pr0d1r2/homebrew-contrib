class YoutubeDlGui < Formula
  homepage "https://github.com/MrS0m30n3/youtube-dl-gui"
  url "https://github.com/pr0d1r2/youtube-dl-gui.git",
    :branch => "osx-app",
    :revision => "eb22a84759872bc6e946d261a9e0ac6a7ad45363"

  # cannot use git tag right now as new version with OSX support not released
  version "0.3.8"

  depends_on :python if MacOS.version <= :snow_leopard
  depends_on "wxpython"
  depends_on "ffmpeg"

  def install
    ENV.prepend_create_path "PYTHONPATH", "#{lib}/python2.7/site-packages"
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
