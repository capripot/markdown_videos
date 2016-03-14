module MarkdownVideos

  #
  # Supported services list
  #
  # regexp:         Regexp must capture in 1) title, 2) full url and 3) video id
  # markup:         HTML markup rendered with first %s being altertive text and second %s being the video URL (iFrame src)
  #                   and third %s being class attribute declaration location (make sure there is only one space after, not before)
  # url:            URL of service included in the markup, with first %s corresponding to video's ID
  # url_parameters: List of authorized URL parameters
  #

  SERVICES = {

    # http://rubular.com/r/8Xb4s9ukXy
    youtube: {
      regexp: /!\[([^\]]*)\]\((https?:\/\/(?:youtu.be\/|www.youtube.com\/(?:watch\?v=|embed\/))([\w\-]{4,16})\??([\w\-\=]+)?)\)/,
      markup: '<iframe width="560" height="315" title="%s" src="%s"%s frameborder="0" allowfullscreen></iframe>',
      url: "https://www.youtube.com/embed/%s",
      url_parameters: [:start]
    },

    # http://rubular.com/r/Upo2dmGbIJ
    vimeo: {
      regexp: /!\[([^\]]*)\]\((https?:\/\/(?:(?:player\.)?vimeo.com\/(?:video\/)?)([0-9]{4,16})\??([\w\-\=]+)?)\)/,
      markup: '<iframe title="%s" src="%s" width="500" height="281"%s frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>',
      url: "https://player.vimeo.com/video/%s",
      url_parameters: []
    }

  }.freeze

end
