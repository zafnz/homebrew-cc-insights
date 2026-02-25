cask "cc-insights" do
  version "0.1.2"
  sha256 "32af22880624be4ec5ba1f77390013c38eabecb3cac2ce3e027c8287ec681ce8"

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
