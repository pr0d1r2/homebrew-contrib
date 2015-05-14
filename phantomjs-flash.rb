require "formula"

class PhantomjsFlash < Formula
  homepage "http://www.ryanbridges.org/2013/05/21/putting-the-flash-back-in-phantomjs"

  head "https://github.com/r3b/phantomjs.git"

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
