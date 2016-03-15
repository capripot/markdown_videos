module MarkdownVideos
  module Services

    class ServiceBase

      attr_accessor :resource_id,
                    :alt_text,
                    :markdown_url,
                    :markdown_url_data,
                    :width,
                    :height,
                    :wrapper,
                    :class_name

      def self.support(markdown_url)
        markdown_url =~ regexp
      end

      # URL matcher
      def self.regexp
        raise NotImplementedError "#{self.class} should implement #regexp method"
      end


      def initialize(alt_text, markdown_url, options)
        @alt_text = alt_text
        @markdown_url = markdown_url.strip
        options.each { |option, value| self.send("#{option}=", value) }
      end

      # URL to be consumed by #to_html
      def url
        raise NotImplementedError "#{self.class} should implement #url method"
      end

      # List of authorized url parameters
      #
      # @return [Array<Symbol>] e.g.: [:start]
      def url_parameters
        []
      end

      def width
        @width || 500
      end

      def height
        @height || 281
      end

      # @return [String] escaped alternative text given through markdown syntax
      def alt_text
        CGI::escapeHTML(@alt_text)
      end

      # @return [String] resource ID of the service resource rendered base on given URL
      def resource_id
        @resource_id ||= markdown_url_data[2]
      end

      # @return [MatchData] match data from matching URL to service regexp
      def markdown_url_data
        @markdown_url_data ||= self.class.regexp.match(markdown_url)
      end

      # @return [String] service URL to be consumed by #to_html
      def service_url
        given_url = Addressable::URI.parse(markdown_url)
        given_url_parameters = given_url.query_values || {}
        given_url_parameters.select! { |attribute, value| url_parameters.include?(attribute.to_sym) && (!value.nil? || !value.empty?) }

        service_url = Addressable::URI.parse(url)
        service_url.query_values = given_url_parameters unless given_url_parameters.nil? || given_url_parameters.empty?
        service_url.to_s
      end

      # Default HTML rendering
      #
      # @retun [String] markup to render
      def to_html
        "<iframe #{html_dom_properties}></iframe>"
      end

      # Renders the set of HTML attributes
      #
      # @return [String] string of dom properties
      def html_dom_properties
        html_attributes.map { |k, v| render_param(k, v) }.compact.join(" ")
      end

      # Default set of HTML attributes for default iframe element
      #
      # @return [Hash]
      def html_attributes
        {
          title: alt_text,
          src: service_url,
          width: width,
          height: height,
          class: class_name,
          frameborder: "0",
          webkitallowfullscreen: true,
          mozallowfullscreen: true,
          allowfullscreen: true
        }
      end

      def render
        if wrapper
          sprintf(wrapper, to_html)
        else
          to_html
        end
      end

      private

      # Renders HTML5 attribute, meant to be used with `Hash.map`
      #
      # @param attribute [Symbol, String]
      # @param value [true, String, false] `true` if you want only the attribute. `false`, `nil` or empty String to skip attribute
      #
      # @return [String] attribute="value"
      def render_param(attribute, value)
        if value == true
          attribute.to_s
        elsif !value || value.to_s.empty?
          nil
        else
          "#{attribute}=\"#{value}\""
        end
      end

    end
  end

end
