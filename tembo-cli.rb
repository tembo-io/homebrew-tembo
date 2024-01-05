class TemboCLI < Formula
  desc "Tembo CLI allows users to experience Tembo locally, as well as, manage and deploy to Tembo Cloud."
  homepage "https://github.com/tembo-io/tembo/tree/main/tembo-cli"
  version "0.13.4"
  @@filename = nil
  if OS.mac?
    @@release_version = "2024.1.3"
    if Hardware::CPU.arm?
      @@filename = "tembo-cli-#{cli_version}-aarch64-apple"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 ""
    else
      @@filename = "tembo-cli-#{cli_version}-x86_64-apple"
      url "https://github.com/tembo-io/tembo/releases/download/#{@@release_version}/#{@@filename}"
      sha256 ""
    end
  elsif OS.linux?
      ohdie "Linux not supported by this formula"
  end

  test do
    system "#{bin}/tembo", "--version"
  end
end
