# GalAxI

Releases of the GalAxI desktop app (beta) for macOS and Linux. Downloads and
checksums are on the [Releases](https://github.com/libertomed/galaxi-dev/releases) page.

## Install with Homebrew (macOS)

```bash
brew tap libertomed/galaxi-dev https://github.com/libertomed/galaxi-dev
brew trust libertomed/galaxi-dev
brew install --cask galaxi
```

`brew trust` is required by Homebrew 7 and later before it loads casks from a
third-party tap; on older versions skip that line.

Update to a new release:

```bash
brew upgrade --cask galaxi
```

Uninstall (add `--zap` to also remove GalAxI's data and settings):

```bash
brew uninstall --cask galaxi
```

The beta is not signed or notarized. If macOS blocks the app the first time,
remove the quarantine attribute:

```bash
xattr -dr com.apple.quarantine /Applications/GalAxI.app
```

Requires macOS 12 (Monterey) or later, on Apple silicon or Intel.

## Install manually

### macOS

Download `GalAxI-<version>-arm64.dmg` (Apple silicon) or
`GalAxI-<version>-x64.dmg` (Intel) from the latest release, open it and drag
GalAxI to Applications. Then right-click GalAxI.app and choose Open, or run the
`xattr` command above.

### Linux (AppImage)

```bash
chmod +x GalAxI-*.AppImage && ./GalAxI-*.AppImage
```

On Ubuntu 24.04 and newer, AppImages need FUSE 2: `sudo apt install libfuse2t64`.
Without it, run `./GalAxI-*.AppImage --appimage-extract-and-run`.

## Updates

GalAxI checks this repository for new releases and shows a notice when one is
available. Homebrew installs are updated with `brew upgrade --cask galaxi`;
manual installs download the new file from the notice.
