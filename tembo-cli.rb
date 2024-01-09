class TemboCli < Formula
  desc "Tembo CLI allows users to experience Tembo locally, as well as, manage and deploy to Tembo Cloud."
  homepage "https://github.com/tembo-io/tembo/tree/main/tembo-cli"
  version "0.13.5"
  @@filename = nil
  @@release_version = "2024.1.8"
  if OS.mac?

    if [[ "${UNAME_MACHINE}" == "arm64" ]]
      @@filename = "tembo-cli-#{version}-aarch64-apple.tar.gz"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 "2f8f80adfa2521196425bf05fc5c0f05b59ec68af2d89a2c3ea891f7d0cfb4c9"
    else
      @@filename = "tembo-cli-#{version}-x86_64-apple.tar.gz"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 "d3c709573604a2878ad8410d8f019326238b909dd5255674fa62f27199356284"
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
