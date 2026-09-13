cask "mixxx@snapshot" do
  arch arm: "arm", intel: "intel"

  sha256 arm:   "8e0ea581918bd25cae2e8e00af49c9597ebc97a70d0ee6a028a1b2e07ce0721e",
         intel: "09ec7a0fee5ef2759aef9058453cc0be0eaf5b05b5c2512047bc4f5eedc954fd"

  on_arm do
    version "2.7-alpha-392-g3e5f59002c"
  end
  on_intel do
    version "2.7-alpha-392-g3e5f59002c"
  end

  url "https://downloads.mixxx.org/snapshots/main/mixxx-#{version}-macos#{arch}.dmg"
  name "Mixxx"
  desc "Open-source DJ software"
  homepage "https://www.mixxx.org/"

  livecheck do
    url "https://downloads.mixxx.org/snapshots/main/manifest.json"
    strategy :json do |json|
      json.dig("macos-macos#{arch}", "git_describe")
    end
  end

  conflicts_with cask: "mixxx"
  depends_on :macos

  app "Mixxx.app"

  zap trash: [
    "~/Library/Application Scripts/org.mixxx.mixxx",
    "~/Library/Containers/org.mixxx.mixxx",
    "~/Music/Mixxx",
  ]
end
