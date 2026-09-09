cask "searoom" do
  version "0.7.0"
  sha256 "65512853648fb38293d46f89a52dcdb96251d8e8a229c909ede2c2e1d9652ead"

  url "https://github.com/emaitchess/searoom/releases/download/v#{version}/Searoom.dmg"
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
