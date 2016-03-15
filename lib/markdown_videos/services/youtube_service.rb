module MarkdownVideos::Services

  class YoutubeService < ServiceBase

    def self.regexp
      /^(https?:\/\/(?:youtu.be\/|www.youtube.com\/(?:watch\?v=|embed\/))([\w\-]{4,16})\??([\w\-\=]+)?)$/
    end

    def width
      560
    end

    def height
      315
    end

    def url
      "https://www.youtube.com/embed/#{resource_id}"
    end

    def url_parameters
      [:start]
    end

  end

end
