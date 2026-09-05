class MovieboxTui < Formula
  VERSION = "0.1.16"
  MACOS_SHA256 = "e9771f29cc2494cd2caffa9aa71d0aac487324b9abda21cdbc46ee6996f09826"
  LINUX_X64_SHA256 = "9eceb6331a082a35f527092f33b9335d5994f82e79b7c6d8f02a246867ad1e5b"
  LINUX_ARM64_SHA256 = "36d3c365908b7be082fe5c34a94e770a926e9aaf74bb0124cebaff33bb517cc5"

  desc "Stream movies, shows, anime, and live TV from your terminal"
  homepage "https://github.com/mesamirh/MovieBox-Tui"
  version VERSION
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_macOS_Universal.tar.gz"
    sha256 MACOS_SHA256
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_arm64.tar.gz"
      sha256 LINUX_ARM64_SHA256
    else
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_x64.tar.gz"
      sha256 LINUX_X64_SHA256
    end
  end

  def install
    bin.install "moviebox-tui"
  end

  test do
    system "#{bin}/moviebox-tui", "--version"
  end
end
