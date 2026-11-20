cask "galaxi" do
  arch arm: "arm64", intel: "x64"

  version "0.4.2"
  sha256 arm:   "2336583f6d51e203ceb140d4cbd59d1bd53e6e2e3d3b6e462c368f0002175434",
         intel: "7e52170dadf3047f90cbe5615ee22ea3835b34471b4b7b2752eccbbc72c1a5b1"

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
