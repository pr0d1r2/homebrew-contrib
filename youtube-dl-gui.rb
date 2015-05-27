class YoutubeDlGui < Formula
  desc "A cross platform front-end GUI of the popular youtube-dl."
  homepage "https://github.com/MrS0m30n3/youtube-dl-gui"
  url "https://github.com/pr0d1r2/youtube-dl-gui.git",
    :branch => "osx-app",
    :revision => "a61d117bd4d925edf465d0fb6dd9f6ea282c2f79"

  # cannot use git tag right now as new version with OSX support not released
  version "0.3.8"

  depends_on :python if MacOS.version <= :snow_leopard
  depends_on "wxpython"
  depends_on "ffmpeg"
  depends_on "py2app"

  def install
    ENV.prepend_create_path "PYTHONPATH", "#{lib}/python2.7/site-packages"
    system "python", "setup.py", "py2app"
    cp_r "dist/Youtube-DLG.app", "#{prefix}/YoutubeDlGui.app"
  end

  test do
    contents_path = "#{prefix}/YoutubeDlGui.app/Contents"
    assert File.exist?("#{contents_path}/MacOS/python")
    assert File.exist?("#{contents_path}/MacOS/Youtube-DLG")
  end
end
