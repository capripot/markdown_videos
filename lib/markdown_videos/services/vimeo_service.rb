module MarkdownVideos::Services

  class VimeoService < ServiceBase

    def self.regexp
      /(https?:\/\/(?:(?:player\.)?vimeo.com\/(?:video\/)?)([0-9]{4,16})\??([\w\-\=]+)?)/
    end

    def url
      "https://player.vimeo.com/video/#{resource_id}"
    end

  end

end
