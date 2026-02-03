cask "cc-insights" do
  version "0.0.4"
  sha256 "4048c47a5242ae7bdd3da2341e16472751f8c7c61570d225d302c5c9e66337f0"

  url "https://github.com/zafnz/cc-insights/releases/download/v#{version}/cc-insights-macos.zip"
  name "CC Insights"
  desc "GUI control plane for coordinating Claude agents across git worktrees"
  homepage "https://github.com/zafnz/cc-insights"

  app "CC Insights.app"
  binary "#{appdir}/CC Insights.app/Contents/MacOS/CC Insights", target: "cc-insights"

  zap trash: [
    "~/Library/Application Support/CC Insights",
    "~/Library/Preferences/com.nickclifford.ccinsights.plist",
  ]
end
