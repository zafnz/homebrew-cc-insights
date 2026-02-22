cask "cc-insights" do
  version "0.0.18"
  sha256 "d111d203a75d87db695c60bd0f14939239605c697f0e0e70a976c6d8344a5e76"

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
