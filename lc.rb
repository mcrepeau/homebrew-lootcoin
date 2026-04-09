# Homebrew formula for the Lootcoin CLI wallet (lc).
#
# This file lives in the lootcoin repo for reference. To publish it, copy it
# into a tap repo (github.com/<you>/homebrew-lootcoin) so users can install
# with:
#
#   brew tap mcrepeau/lootcoin
#   brew install lc
#
# After each release:
#   1. Update `version` below.
#   2. Replace the sha256 values with those from the release's checksums.txt
#      (printed in the "Publish release" job summary on GitHub Actions).
#   3. Commit and push the tap repo.

class Lc < Formula
  desc "CLI wallet for Lootcoin"
  homepage "https://github.com/mcrepeau/lootcoin"
  version "3.2.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/mcrepeau/lootcoin/releases/download/v#{version}/lc-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1e66a13cdadf333bd7b80c1da85169e01990ac00f931ebed85edb717e41a515b"
    end
    on_intel do
      url "https://github.com/mcrepeau/lootcoin/releases/download/v#{version}/lc-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "bd892afe61dea7643cabe7a44da14120f92a2eb136031a80e90364842aa8f29e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mcrepeau/lootcoin/releases/download/v#{version}/lc-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7641963e7b345f030645fff6ed9b80ae7b9e7f05af37cd4b0164df44c739a6f8"
    end
    on_intel do
      url "https://github.com/mcrepeau/lootcoin/releases/download/v#{version}/lc-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6606d07888ad1616f33e21b6ca436dfe81ce4d999a67645d23638a3c33d8bfc7"
    end
  end

  def install
    bin.install "lc"
    man1.install "man/lc.1"
    bash_completion.install "completions/lc.bash" => "lc"
    zsh_completion.install  "completions/lc.zsh"  => "_lc"
    fish_completion.install "completions/lc.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lc --version")
  end
end
