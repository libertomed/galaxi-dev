cask "galaxi" do
  arch arm: "arm64", intel: "x64"

  version "0.4.1"
  sha256 arm:   "1285efe6c11128e2161faaceee17599ac0012ea9ea94b2fee6270cae22f907e6",
         intel: "6db6eba9dff0a509b85172c7bbbbbb55c6da327e6201ab2628fdfe2b1a264980"

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
