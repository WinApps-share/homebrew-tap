cask "nextai-translator" do
  version "0.6.52"
  sha256 "4efe6433803976a092066a75da5af0e20eafe4f560e6562ad471b610465e98b7"

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
