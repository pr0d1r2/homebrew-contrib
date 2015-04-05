class YoutubeDlGui < Formula
  homepage "https://github.com/pr0d1r2/youtube-dl-gui"
  url "https://github.com/pr0d1r2/youtube-dl-gui.git",
    :branch => "osx"
  version "0.3.7"

  depends_on "python"
  depends_on "wxpython"
  depends_on "ffmpeg"

  def install
    ENV.prepend_create_path "PYTHONPATH", "#{lib}/python2.7/site-packages"
    system "python", "setup.py", "install", "--prefix=#{prefix}"
    system "mkdir", "-p", "#{prefix}/YoutubeDlGui.app/Contents/MacOS"
    system "cp", "#{prefix}/bin/youtube-dl-gui", "#{prefix}/YoutubeDlGui.app/Contents/MacOS/YoutubeDlGui"
    system "mkdir", "-p", "#{prefix}/YoutubeDlGui.app/Contents/Resources/"
    system "cp", "osx/YoutubeDlGui.icns", "#{prefix}/YoutubeDlGui.app/Contents/Resources/YoutubeDlGui.icns"
    system "cp", "osx/empty.lproj", "#{prefix}/YoutubeDlGui.app/Contents/Resources/empty.lproj"
    system "cp", "osx/Info.plist", "#{prefix}/YoutubeDlGui.app/Contents/Info.plist"
    system "cp", "osx/PkgInfo", "#{prefix}/YoutubeDlGui.app/Contents/PkgInfo"
  end
end
