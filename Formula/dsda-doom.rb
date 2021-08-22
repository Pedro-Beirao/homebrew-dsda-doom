class DsdaDoom < Formula
  desc "This is a fork of prboom+ with a focus on speedrunning"
  homepage "https://github.com/kraflab/dsda-doom"
  url "https://github.com/kraflab/dsda-doom/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "a552258459478b0ef24b65b8f1e3b027098a9d050106d51c9996a30f76e630df"
  license "GPL-2.0-only"

  head "https://github.com/kraflab/dsda-doom"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "dumb"
  depends_on "fluid-synth"
  depends_on "libpng"
  depends_on "mad"
  depends_on "pcre"
  depends_on "portmidi"
  depends_on "sdl2"
  depends_on "sdl2_mixer"
  depends_on "sdl2_net"

  def install
    system "cmake", "./prboom2"
    system "make"
    bin.install "dsda-doom", "dsda-doom.wad"
  end

  test do
    testdata = <<~EOS
    EOS
    (testpath/"test_invalid.wad").write testdata
    cp "#{bin}/dsda-doom.wad", "."
    shell_output("#{bin}/dsda-doom -iwad test_invalid.wad", 255)
  end
end
