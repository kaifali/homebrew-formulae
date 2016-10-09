class Kaifa < Formula
  desc "Command-line tool for kaifa.li"
  homepage "https://github.com/kaifali/cli"
  url "https://github.com/kaifali/cli/archive/v0.2.1.tar.gz"
  sha256 "25fb219760f69a6e95629cae67775ee4fef0c30f1cd07080b5525228ed7ec322"

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
