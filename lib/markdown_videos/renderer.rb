require "addressable/uri"

module MarkdownVideos

  class Renderer

    def initialize(string, options = {})
      @string = string
      @options = {
        wrapper: MarkdownVideos.defaults.wrapper,
        classname: MarkdownVideos.defaults.classname
      }.merge(options || {})
    end

    def render
      @string.gsub(/!\[([^\]]*)\]\(([^)]+)\)/) do
        rendered = nil
        match_data = Regexp.last_match
        markdown = {
          alt_text: match_data[1],
          url: match_data[2]
        }

        service_class = find_service_for(markdown[:url])

        if service_class
          service_class.new(markdown[:alt_text], markdown[:url], @options).render
        else
          match_data.string
        end
      end
    end

    def find_service_for(url)
      MarkdownVideos::SERVICES.find { |service_class| service_class.support(url) }
    end

  end

end
