class TemboCli < Formula
  desc "Tembo CLI allows users to experience Tembo locally, as well as, manage and deploy to Tembo Cloud."
  homepage "https://github.com/tembo-io/tembo/tree/main/tembo-cli"
  version "0.13.4"
  @@filename = nil
  @@release_version = "0.0.9"
  if OS.mac?

    if [[ "${UNAME_MACHINE}" == "arm64" ]]
      @@filename = "tembo-cli-#{version}-aarch64-apple.tar.gz"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 "23adb2d747da7b6c491d5cce2c9115631db9b8eb8e2fd04e88631d361433943e"
    else
      @@filename = "tembo-cli-#{version}-x86_64-apple.tar.gz"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 "959d5b3b4d700276b86f5a85d3d2d7d16ad9ff22b8f8962bd34bafd6f776d440"
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
