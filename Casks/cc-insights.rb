cask "cc-insights" do
  version "0.0.12"
  sha256 "d743168172f9385bf02797832d7b903131bc3e09c07ca80d635d6e50c494edf3"

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
