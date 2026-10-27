cask "galaxi" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "60e598b26982789e682af0874f51fd98a9962bad916cdfdbffcbdecff5313938",
         intel: "5c567812c51ab01958ad745d02922c91f46ecd247b2e724f09a11fc5fd1871fa"

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
