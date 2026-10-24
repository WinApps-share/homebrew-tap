cask "nextai-translator" do
  version "0.6.45"
  sha256 "edde18157b594b59d8002dd3a25f3263f151cd1fcf21bc27bc85f557403cab31"

  url "https://github.com/nextai-translator/nextai-translator/releases/download/v#{version}/NextAI.Translator_#{version}_aarch64.dmg"
  name "NextAI Translator"
  desc "基于 ChatGPT API 的划词翻译软件"
  homepage "https://github.com/nextai-translator/nextai-translator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "NextAI Translator.app"

  zap trash: [
    "~/Library/Application Support/xyz.yetone.apps.openai-translator",
    "~/Library/Caches/xyz.yetone.apps.openai-translator",
    "~/Library/WebKit/xyz.yetone.apps.openai-translator",
  ]
end
