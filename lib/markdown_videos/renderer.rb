require "addressable/uri"

module MarkdownVideos

  class Renderer

    def initialize(string, options = {})
      @string = string
      @options = {
        size: nil
      }
    end

    def render
      MarkdownVideos::SERVICES.keys.each do |service|
        @string = render_service(service)
      end
      @string
    end

    private

    def render_service(service)
      values = MarkdownVideos::SERVICES[service]
      @string.gsub(values[:regexp]) do |match|
        match_data = Regexp.last_match
        id = match_data[3]
        title = match_data[1]
        url = Addressable::URI.parse(match_data[2])
        url_parameters = url.query_values || {}

        sprintf(values[:markup], title.gsub(/["\\]/, '"' => '\\"', '\\' => '\\\\'), service_url(service, id, url_parameters))
      end
    end

    def service_url(service, id, url_parameters = {})
      url = sprintf(MarkdownVideos::SERVICES[service][:url], id)
      uri = Addressable::URI.parse(url)
      url_parameters.select! { |k, v| MarkdownVideos::SERVICES[service][:url_parameters].include?(k.to_sym) && (!v.nil? || !v.empty?) } if url_parameters
      uri.query_values = url_parameters unless url_parameters.nil? || url_parameters.empty?
      uri.to_s
    end

  end

end
