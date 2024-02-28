class DarkModeDaemon < Formula
  desc "Runs scripts when the system changes between dark and light mode"
  version "0.0.1"
  homepage "https://github.com/NiclasvanEyk/homebrew-dark-mode-daemon"
  license "MIT"

  on_macos do
    depends_on :xcode
  end

  service do
    name macos: "niclasvaneyk.dark-mode-daemon"
  end

  def install
    if OS.mac? then
      system "swift", "build", "--disable-sandbox", "-c", "release"
      bin.install ".build/release/dark-mode-daemon" => "dark-mode-daemon"
    end
  end

  def install
    if OS.mac? then
      system "dark-mode-daemon"
    end
  end
end
