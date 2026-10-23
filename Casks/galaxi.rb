cask "galaxi" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0-beta.10"
  sha256 arm:   "f0390fbdabd3cb91e460eff27792eb48f66e41a23d3a6312f47d068eb039f6b9",
         intel: "a72a6e4e9a4a77e750825f8b0ecbc180d0785edaf02081093a7d3041e5a67f25"

  url "https://github.com/libertomed/galaxi-dev/releases/download/v#{version}/GalAxI-#{version}-#{arch}.zip"
  name "GalAxI"
  desc "Workspace for projects, terminals, runbooks and coding agents"
  homepage "https://github.com/libertomed/galaxi-dev"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:[._-]beta[._-]?\d+)?)$/i)
    strategy :github_releases
  end

  depends_on macos: :monterey

  app "GalAxI.app"

  zap trash: [
    "~/Library/Application Support/galaxi",
    "~/Library/Application Support/galaxi-desktop",
    "~/Library/Preferences/dev.galaxi.desktop.plist",
    "~/Library/Saved Application State/dev.galaxi.desktop.savedState",
  ]

  caveats <<~EOS
    GalAxI beta builds are not signed or notarized. If macOS blocks the app,
    remove the quarantine attribute:
      xattr -dr com.apple.quarantine "#{appdir}/GalAxI.app"
  EOS
end
