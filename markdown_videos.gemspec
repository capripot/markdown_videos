$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "markdown_videos/version"

Gem::Specification.new do |gem|
  gem.name          = "markdown_videos"
  gem.description   = "Markdown syntax video parser"
  gem.version       = MarkdownVideos::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.summary       = "A gem that provides ability to parse any string containing image markdown syntax into appropriate video HTML embed based on URL."
  gem.email         = "capripot@gmail.com"
  gem.homepage      = "https://github.com/capripot/markdown_videos"
  gem.authors       = ["Capripot"]
  gem.has_rdoc      = false
  gem.license       = "LGPL-3.0"

  gem.files         = Dir["lib/**/*"]
  gem.test_files    = gem.files.grep(/^spec/)

  gem.add_dependency "addressable", "~> 2.4"
  gem.add_development_dependency "rubocop", "~> 0.37"
  gem.add_development_dependency "rspec", "~> 3.4"
end
