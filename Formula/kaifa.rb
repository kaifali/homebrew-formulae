class Kaifa < Formula
  desc "Command-line tool for kaifa.li"
  homepage "https://github.com/kaifali/cli"
  url "https://github.com/kaifali/cli/archive/v0.1.0.tar.gz"
  sha256 "b5f248e830f0ed8f3379fb4fc8d486b824186ce4460d36000bc5d551f10e6d1c"

  head "https://github.com/kaifali/cli.git"

  depends_on "go" => :build
  depends_on "gpm" => :build

  def install
    puts buildpath

    ENV["GOPATH"] = buildpath

    system "gpm", "install"
    system "go", "build", "kaifa.go"
    bin.install "kaifa"
  end

  test do
    system "#{bin}/kaifa", "--version"
  end
end
