# Homebrew tap for Searoom

[Searoom](https://searoom.app) is a quiet, local system-telemetry instrument for
Apple silicon Macs, built for watching capacity while local LLMs and other heavy
work are running.

```sh
brew install --cask emaitchess/searoom/searoom
```

That installs the signed, notarized build from the
[releases](https://github.com/emaitchess/searoom/releases) of the
[main repository](https://github.com/emaitchess/searoom).

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

The official cask repository asks for "substantial, independently verifiable
public interest" before accepting new software. Until Searoom clears that bar,
this tap is the supported way to install it with one command.

## License

The cask definition here is [MIT](LICENSE) licensed, as is Searoom itself.
