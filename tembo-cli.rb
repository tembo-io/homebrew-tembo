class TemboCli < Formula
  desc "Tembo CLI allows users to experience Tembo locally, as well as, manage and deploy to Tembo Cloud."
  homepage "https://github.com/tembo-io/tembo/tree/main/tembo-cli"
  version "0.21.1"
  @@filename = nil
  @@release_version = "2025.02.28"
  if OS.mac?

    uname = `/usr/bin/uname -m`
    if uname.strip == "arm64"
      @@filename = "tembo-cli-#{version}-aarch64-apple.tar.gz"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 "69136a3ae62a03134516ed4c694cb76fc2930b67f42d1e7bd90992087469de21"
    else
      @@filename = "tembo-cli-#{version}-x86_64-apple.tar.gz"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 "1b4db60d5fb5548078859f1dda5872386b7593bb25d87db563dd5a657e19e14e"
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
