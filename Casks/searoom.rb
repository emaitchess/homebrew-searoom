cask "searoom" do
  version "0.1.0"
  sha256 "e0738c409a042fe506799004c3452206c550d5f0f5d785491e3ccf577e496fe6"

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

  # Searoom keeps everything on the Mac, so uninstalling should genuinely remove
  # it: bounded trend history, preferences, and the saved window state.
  zap trash: [
    "~/Library/Application Support/Searoom",
    "~/Library/Preferences/app.searoom.Searoom.plist",
    "~/Library/Saved Application State/app.searoom.Searoom.savedState",
  ]
end
