cask "galaxi" do
  arch arm: "arm64", intel: "x64"

  version "0.4.3"
  sha256 arm:   "1a249159a54ef831bf5f6cb0aa0ab780d67f078c4276e5ea8a2e8f32d7985db2",
         intel: "66b2c6f418469892b9b758a46ac6c27e8c40d89f010797e7b6bacb0d92e3b7b0"

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
