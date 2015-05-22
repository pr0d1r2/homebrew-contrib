class YoutubeDlGui < Formula
  homepage "https://github.com/MrS0m30n3/youtube-dl-gui"
  url "https://github.com/MrS0m30n3/youtube-dl-gui.git",
    :revision => "36c8147a0ba4da01215d92957246527285cca710"

  # cannot use git tag right now as new version with OSX support not released
  version "0.3.7"

  depends_on :python if MacOS.version <= :snow_leopard
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
