cask "tembo-cli" do
  release_version "2024.1.3"
  cli_version "0.13.4"
  arch arm: "aarch64", intel: "x86_64"
  sha256 arm: "",
         intel: ""
  url "https://github.com/tembo-io/tembo/releases/download/#{release_version}/tembo-cli-#{cli_version}-#{arch}-apple",
      verified: "https://github.com/tembo-io/tembo/"
  name "Tembo CLI"
  desc "Tembo CLI allows users to experience Tembo locally, as well as, manage and deploy to Tembo Cloud."
  homepage "https://github.com/tembo-io/tembo/tree/main/tembo-cli"

  livecheck do
    url "https://github.com/tembo-io/tembo"
    strategy :git
  end

  pkg "tembo.pkg"

  uninstall script: {
    executable: "uninstall.tool",
    input: ["Yes"],
    sudo:  true,
  },
  pkgutil: "com.tembo.tembo"

  zap trash: "~/.tembo.d"

end
