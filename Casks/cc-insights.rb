cask "cc-insights" do
  version "0.0.3"
  sha256 "2116d96e4edde353540c960362d7607b5f98b1df146d180d50a0e4f11e120d50"

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
