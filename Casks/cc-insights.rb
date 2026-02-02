cask "cc-insights" do
  version "0.0.1"
  sha256 "56e93fd0c544be4e82c0e42c0089f30353e87d61ec2c0e4385cad133e7838d60"

  url "https://github.com/zafnz/cc-insights/releases/download/v#{version}/cc-insights-macos.zip"
  name "CC Insights"
  desc "GUI control plane for coordinating Claude agents across git worktrees"
  homepage "https://github.com/zafnz/cc-insights"

  app "CC Insights.app"
  binary "#{appdir}/CC Insights.app/Contents/MacOS/CC Insights", target: "cc-insights"

  zap trash: [
    "~/Library/Application Support/CC Insights",
    "~/Library/Preferences/com.example.cc-insights.plist",
  ]
end
