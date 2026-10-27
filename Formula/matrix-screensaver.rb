class MatrixScreensaver < Formula
  desc "Native macOS screen saver inspired by cmatrix's digital rain"
  homepage "https://github.com/WhiskeyTangoFussell/matrix-screensaver-macos"
  url "https://github.com/WhiskeyTangoFussell/matrix-screensaver-macos/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "6e8a5a6e1467dd481860429717912973fae7344c523b2d30601be378f41ba316"
  license "GPL-3.0-only"

  depends_on macos: :sequoia

  def install
    system "make", "build"
    prefix.install "build/MatrixScreenSaver.saver"
  end

  def caveats
    <<~EOS
      Homebrew can't install into ~/Library, so activate the screen saver with:
        mkdir -p ~/Library/Screen\\ Savers
        cp -R "#{opt_prefix}/MatrixScreenSaver.saver" ~/Library/Screen\\ Savers/
      Run that again after `brew upgrade`. Then choose "Matrix" in
      System Settings → Screen Saver.
    EOS
  end

  test do
    assert_path_exists prefix/"MatrixScreenSaver.saver/Contents/MacOS/MatrixScreenSaver"
  end
end
