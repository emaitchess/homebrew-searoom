cask "searoom" do
  version "0.5.0"
  sha256 "2a7c3f1c528627ac2015dce16c519d1a5f83162119d5ab8c2c9f49c01637a776"

  url "https://github.com/emaitchess/searoom/releases/download/v#{version}/Searoom.dmg",
      verified: "github.com/emaitchess/searoom/"
  name "Searoom"
  desc "Quiet, local system telemetry for Apple silicon Macs under load"
  homepage "https://searoom.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Searoom.app"
  # The same signed executable serves the GUI and the `searoom` CLI. Homebrew
  # manages a lowercase symlink in its bin directory: recreated on upgrade,
  # removed on uninstall, never a copy, so the signature is untouched.
  binary "#{appdir}/Searoom.app/Contents/MacOS/Searoom", target: "searoom"

  # Searoom keeps everything on the Mac, so uninstalling should genuinely remove
  # it: bounded trend history, preferences, and the saved window state.
  zap trash: [
    "~/Library/Application Support/Searoom",
    "~/Library/Preferences/app.searoom.Searoom.plist",
    "~/Library/Saved Application State/app.searoom.Searoom.savedState",
  ]
end
