module MarkdownVideos

  #
  # Supported services list
  #
  # service_key: Array of tests
  #
  # test Hash:
  #  url: URL used in markdown syntax
  #  alt_text: Alternative text, "a title" by default
  #  html: Expected result in HTML
  #

  SERVICE_TESTS = {

    youtube: [
      {
        url: "https://youtu.be/StTqXEQ2l-Y",
        html: '<iframe width="560" height="315" title="a title" src="https://www.youtube.com/embed/StTqXEQ2l-Y" frameborder="0" allowfullscreen></iframe>'
      },
      {
        url: "https://www.youtube.com/watch?v=StTqXEQ2l-Y",
        html: '<iframe width="560" height="315" title="a title" src="https://www.youtube.com/embed/StTqXEQ2l-Y" frameborder="0" allowfullscreen></iframe>'
      },
      {
        url: "https://www.youtube.com/embed/-sdTq0ZxZZg",
        html: '<iframe width="560" height="315" title="a title" src="https://www.youtube.com/embed/-sdTq0ZxZZg" frameborder="0" allowfullscreen></iframe>'
      }
    ],

    # http://rubular.com/r/Upo2dmGbIJ
    vimeo: [
      {
        url: "https://vimeo.com/152640853",
        html: '<iframe title="a title" src="https://player.vimeo.com/video/152640853" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
      }
    ]

  }.freeze

end
