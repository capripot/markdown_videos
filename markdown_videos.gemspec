$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "markdown_videos/version"

Gem::Specification.new do |gem|
  gem.name = "markdown-videos"
  gem.description = "Markdown syntax video parser"
  gem.version = MarkdownVideos::VERSION
  gem.platform = Gem::Platform::RUBY
  gem.summary = "A gem that provides ability to parse any string containing image markdown syntax into appropriate video HTML embed based on URL."
  gem.email = "capripot@gmail.com"
  gem.homepage = "https://github.com/capripot/markdown-videos"
  gem.authors = ["Capripot"]
  gem.has_rdoc = false
  gem.files = Dir["lib/**/*"]
  gem.license = "LGPL-3.0"
  gem.add_dependency "addressable"
  gem.add_development_dependency "rubocop"
  gem.add_development_dependency "rspec"
end
