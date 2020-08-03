class PristineTar < Formula
  desc "Regenerate pristine tarballs"
  homepage "https://kitenet.net/~joey/code/pristine-tar"
  url "https://salsa.debian.org/debian/pristine-tar.git",
      tag:      "1.49",
      revision: "9401d7c09f575173d84727cae58674dbcc20106e"
  license "GPL-2.0"

  bottle do
    root_url "https://dl.bintray.com/dawidd6/bottles-tap"
    sha256 "303377c991a1e0da17d83eff12ad669b2db3344f55978fc8d93f6adf146b73c3" => :catalina
    sha256 "4d66667c2776e575570eb70f50de67d7cd898068edf0ceedadb75675f0f9afd1" => :x86_64_linux
  end

  depends_on "perl" => :build
  depends_on "shunit2" => :build
  depends_on "bzip2"
  depends_on "gnu-tar"
  depends_on "gzip"
  depends_on "pbzip2"
  depends_on "pixz"
  depends_on "xdelta"
  depends_on "xz"

  def install
    system "perl", "Makefile.PL",
        "TAR_PROGRAM=tar", \
        "XDELTA_PROGRAM=xdelta", \
        "ZCAT_PROGRAM=zcat", \
        "PREFIX=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    assert_predicate bin/"pristine-tar", :exist?
  end
end
