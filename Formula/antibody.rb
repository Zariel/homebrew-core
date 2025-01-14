class Antibody < Formula
  desc "The fastest shell plugin manager"
  homepage "https://getantibody.github.io/"
  url "https://github.com/getantibody/antibody/archive/v5.0.1.tar.gz"
  sha256 "df733e8d79b2ab2778a6c72973c76ee59b3f686a4c35b3d0850d523c96c062c4"

  bottle do
    cellar :any_skip_relocation
    sha256 "8e347ef8e6a3557c0161946030aefe3a7fff39e706478f6b20920b5d212f5935" => :catalina
    sha256 "23de0049ce047d57bb3f68de6df2b79aa4b29bf5824f7b1a41bac04632f5c75b" => :mojave
    sha256 "988acf7d1acb5bd2b4d3af297818698bc38cb2f0904e656d9e828e09fe67f6c8" => :high_sierra
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X main.version=#{version}", "-trimpath", "-o", bin/"antibody"
  end

  test do
    # See if antibody can install a bundle correctly
    system "#{bin}/antibody", "bundle", "rupa/z"
    assert_match("rupa/z", shell_output("#{bin}/antibody list"))
  end
end
