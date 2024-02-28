class DarkModeDaemon < Formula
  desc "Runs scripts when the system changes between dark and light mode"
  version "0.0.1"
  url "https://github.com/NiclasvanEyk/dark-mode-daemon/archive/refs/tags/0.0.1.tar.gz"
  homepage "https://github.com/NiclasvanEyk/homebrew-dark-mode-daemon"
  license "MIT"

  on_macos do
    depends_on :xcode

    def install
      system "swift", "build", "--disable-sandbox", "-c", "release"
      bin.install ".build/release/dark-mode-daemon" => "dark-mode-daemon"
    end
  end

  service do
    run [opt_bin/"dark-mode-daemon", "daemon"]
    keep_alive true
    working_dir HOMEBREW_PREFIX
  end

  test do
    if OS.mac? then
      system "dark-mode-daemon"
    end
  end
end
