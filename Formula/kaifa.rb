class Kaifa < Formula
  desc "Command-line tool for kaifa.li"
  homepage "https://github.com/kaifali/cli"
  url "https://github.com/kaifali/cli/archive/v0.0.3.tar.gz"
  sha256 "5ae3502171c330cb6b778fa30af96dcf30e30beb297ea52f4e052038821ced02"

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
