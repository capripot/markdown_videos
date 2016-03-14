module MarkdownVideos

  #
  # Supported services list tests
  #
  # service_key: Array of tests
  #
  # test Hash:
  #  url: URL used in markdown syntax
  #  alt_text: Alternative text, "a title" by default
  #  html: Expected result in HTML
  #  classname: only one entry required, to test HTML class attribute rendering
  #

  SERVICE_TESTS = {

    youtube: [
      {
        url: "https://youtu.be/StTqXEQ2l-Y",
        html: '<iframe title="a title" src="https://www.youtube.com/embed/StTqXEQ2l-Y" width="560" height="315" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
      },
      # testing that the title is well escaped
      {
        url: "https://youtu.be/StTqXEQ2l-Y",
        alt_text: 'any text, it doesn\'t "really" matter',
        html: '<iframe title="any text, it doesn&#39;t &quot;really&quot; matter" src="https://www.youtube.com/embed/StTqXEQ2l-Y" width="560" height="315" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
      },
      {
        url: "https://www.youtube.com/watch?v=StTqXEQ2l-Y",
        html: '<iframe title="a title" src="https://www.youtube.com/embed/StTqXEQ2l-Y" width="560" height="315" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
      },
      {
        url: "https://www.youtube.com/embed/-sdTq0ZxZZg",
        html: '<iframe title="a title" src="https://www.youtube.com/embed/-sdTq0ZxZZg" width="560" height="315" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
      },
      {
        url: "https://www.youtube.com/embed/-sdTq0ZxZZg?start=63",
        html: '<iframe title="a title" src="https://www.youtube.com/embed/-sdTq0ZxZZg?start=63" width="560" height="315" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
      },
      # one classname test per service is required
      {
        classname: "embed-responsive-item",
        url: "https://www.youtube.com/embed/-sdTq0ZxZZg",
        html: '<iframe title="a title" src="https://www.youtube.com/embed/-sdTq0ZxZZg" width="560" height="315" class="embed-responsive-item" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
      }
    ],

    vimeo: [
      {
        url: "https://vimeo.com/152640853",
        html: '<iframe title="a title" src="https://player.vimeo.com/video/152640853" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
      },
      {
        url: "https://player.vimeo.com/video/152640853",
        html: '<iframe title="a title" src="https://player.vimeo.com/video/152640853" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
      },
      {
        url: "https://vimeo.com/152640853",
        classname: "embed-responsive-item",
        html: '<iframe title="a title" src="https://player.vimeo.com/video/152640853" width="500" height="281" class="embed-responsive-item" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
      }
    ]

  }.freeze

end
