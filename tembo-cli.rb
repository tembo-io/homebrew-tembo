class TemboCli < Formula
  desc "Tembo CLI allows users to experience Tembo locally, as well as, manage and deploy to Tembo Cloud."
  homepage "https://github.com/tembo-io/tembo/tree/main/tembo-cli"
  version "0.20.4"
  @@filename = nil
  @@release_version = "2024.05.07"
  if OS.mac?

    uname = `/usr/bin/uname -m`
    if uname.strip == "arm64"
      @@filename = "tembo-cli-#{version}-aarch64-apple.tar.gz"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 "8f09686e88a52e58bba575c9d084321469fdda32eaf774b0bb5a339b48b5afce"
    else
      @@filename = "tembo-cli-#{version}-x86_64-apple.tar.gz"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 "45c905d7d7cc0f0f064e3bbddb1f3fb3afe5ed1178b2d4e346d87c9cbc643d9d"
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
