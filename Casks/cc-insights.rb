cask "cc-insights" do
  version "0.1.0"
  sha256 "6e4d1602101cf39c15f016b2d918e0cbe0079c47db2ca694cfda9030b3b6a4dc"

  url "https://github.com/zafnz/cc-insights/releases/download/v#{version}/cc-insights-macos.zip"
  name "CC Insights"
  desc "GUI control plane for coordinating Claude agents across git worktrees"
  homepage "https://github.com/zafnz/cc-insights"

  app "CC Insights.app"

  preflight do
    File.write("#{staged_path}/cc-insights", <<~EOS)
      #!/bin/bash
      exec "#{appdir}/CC Insights.app/Contents/MacOS/CC Insights" "$@"
    EOS
    set_permissions "#{staged_path}/cc-insights", "0755"
  end

  binary "#{staged_path}/cc-insights"

  zap trash: [
    "~/Library/Application Support/CC Insights",
    "~/Library/Preferences/com.nickclifford.ccinsights.plist",
  ]
end
