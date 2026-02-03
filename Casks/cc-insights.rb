cask "cc-insights" do
  version "0.0.8"
  sha256 "945e11046a5778e4f0e68b139a99a92c7482fe23bbf148c5e5d0e167385a2fab"

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
