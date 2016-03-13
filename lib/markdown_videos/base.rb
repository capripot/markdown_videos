require "markdown_videos/renderer"
require "markdown_videos/services"

module MarkdownVideos

  def render(string)
    MarkdownVideos::Renderer.new(string).render
  end

  module_function :render

end
