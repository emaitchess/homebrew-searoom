# Homebrew tap for Searoom

[Searoom](https://searoom.app) is a quiet, local system-telemetry instrument for
Apple silicon Macs, built for watching capacity while local LLMs and other heavy
work are running.

```sh
brew install emaitchess/searoom/searoom
```

That installs the signed, notarized build from the
[releases](https://github.com/emaitchess/searoom/releases) of the
[main repository](https://github.com/emaitchess/searoom).

The fully qualified `user/repo/name` form does the whole job in one command:
`brew install` adds the tap, records trust for this one cask, and installs.
Homebrew's `cmd/install.rb` calls `ensure_installed!` on the tap and then
`Trust.trust_fully_qualified_items!`, which trusts any fully qualified item from
an unofficial tap without prompting. Trust is recorded in
`~/.homebrew/trust.json`.

The shorter form still needs both steps first, because Homebrew refuses casks
from untrusted third-party taps and fails with "Refusing to load cask from
untrusted tap":

```sh
brew tap emaitchess/searoom
brew trust --tap emaitchess/searoom
brew install --cask searoom
```

## Updating

Searoom has no built-in updater and makes no network requests on its own, so
Homebrew is the update path:

```sh
brew update && brew upgrade --cask searoom
```

## Uninstalling

```sh
brew uninstall --cask searoom          # removes the app
brew uninstall --zap --cask searoom    # also removes preferences and trend history
```

## Why a tap rather than homebrew/cask

Homebrew's package acceptance policy sets a notability bar of "at least 30
forks, 30 watchers or 75 stars", raised to "at least 90 forks, 90 watchers or
225 stars for a self-submission by the repository owner". A repository under 30
days old is not eligible either.

Searoom does not clear that yet, so this tap is the supported way to install it.
Nothing else is in the way: the download is published by the developer, the DMG
is Developer ID signed and notarized so it passes Gatekeeper, and the cask here
would need little editing to become a homebrew/cask submission. The `searoom`
token is unclaimed in both the cask and formula namespaces.

For scale, AirStats is a comparable menu-bar monitor whose repository was created
three days before Searoom's. It was accepted into homebrew/cask on 2026-09-03 as
a self-submission with 271 stars.

## License

The cask definition here is [MIT](LICENSE) licensed, as is Searoom itself.
