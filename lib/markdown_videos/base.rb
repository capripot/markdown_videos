require "markdown_videos/services"
require "markdown_videos/renderer"
require "markdown_videos/configuration"

module MarkdownVideos

  def self.render(string, options = {})
    MarkdownVideos::Renderer.new(string, options).render
  end

  def self.configure
    @configuration = Configuration.new
    yield(@configuration) if block_given?
    @configuration
  end

  def self.defaults
    @configuration || configure
  end

end
