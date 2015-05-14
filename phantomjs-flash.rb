require "formula"

class PhantomjsFlash < Formula
  homepage "http://www.ryanbridges.org/2013/05/21/putting-the-flash-back-in-phantomjs"

  url "https://github.com/r3b/phantomjs.git",
    :revision => "295071ebc9dcb5f71b00e5e3e6e03a8dd3141208"
  version "1.9.0"

  %w(phantomjs phantomjs17 phantomjs182 phantomjs192 phantomjs198).each do |f|
    conflicts_with f, :because => "ships same binary"
  end

  def install
    system "./build.sh", "--confirm", "--jobs", ENV.make_jobs,
      "--qt-config", "-openssl-linked"
    bin.install "bin/phantomjs"
    (share+"phantomjs").install "examples"
  end

  test do
    path = testpath/"test.js"
    path.write <<-EOS
      console.log("hello");
      phantom.exit();
    EOS

    assert_equal "hello", shell_output("#{bin}/phantomjs #{path}").strip
  end
end
