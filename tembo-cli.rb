class TemboCli < Formula
  desc "Tembo CLI allows users to experience Tembo locally, as well as, manage and deploy to Tembo Cloud."
  homepage "https://github.com/tembo-io/tembo/tree/main/tembo-cli"
  version "0.20.4"
  @@filename = nil
  @@release_version = "2024.04.23"
  if OS.mac?

    uname = `/usr/bin/uname -m`
    if uname.strip == "arm64"
      @@filename = "tembo-cli-#{version}-aarch64-apple.tar.gz"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 "06d282ba8b15552f10a29d06f217fb71f1e9be80869d77078653df2329aaea4e"
    else
      @@filename = "tembo-cli-#{version}-x86_64-apple.tar.gz"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 "cc69576cdf072f124193d923ed06389a4ae05bcfec6bd9dbfeffb5da0a0e8f2d"
    end
  elsif OS.linux?
      ohdie "Linux not supported by this formula"
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    bin.install "tembo"
  end

  test do
    system "#{bin}/tembo", "--version"
  end
end
