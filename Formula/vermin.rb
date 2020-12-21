class Vermin < Formula
  desc "Smart virtual machines manager supporting Vagrant boxes"
  homepage "https://mhewedy.github.io/vermin"
  url "https://github.com/mhewedy/vermin/archive/v0.125.0.tar.gz"
  sha256 "cf6d9c1513ee9f1426b702a1f5aff3d3076c919ab227a2dc0664a96fb74b9033"
  license "Apache-2.0"
  head "https://github.com/mhewedy/vermin.git"

  bottle do
    root_url "https://github.com/dawidd6/homebrew-tap/releases/download/vermin-0.122.0"
    cellar :any_skip_relocation
    sha256 "f2653c29e27c9bba28344db60170892b33611ad866bedddfd967e4eeaeb31a90" => :big_sur
    sha256 "769ca821e6bdf11376216dcee37d8ba07b753f7f3b24fff3277efb55dffb8e65" => :catalina
    sha256 "afb44cd12f1acb7b4efac033dd3c45f3d6a3ac6cde61b2e0b35dd1a68637c492" => :x86_64_linux
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    assert_match "ubuntu", shell_output("#{bin}/vermin images")
  end
end
