# Markdown Videos

[![Travis CI Test status](https://travis-ci.org/capripot/markdown_videos.svg)](https://travis-ci.org/capripot/markdown_videos)
[![Gem Version](https://badge.fury.io/rb/markdown_videos.svg)](https://badge.fury.io/rb/markdown_videos)

Have you ever wished the [markdown image syntax](https://daringfireball.net/projects/markdown/syntax#img) would be able to render more than just images?

`markdown_videos` helps you with that dream, and renders automatically your markdown image syntax elements to the appropriate embed video service HTML markup.

## Installation

```
$ gem install markdown_videos
```

or add it to your `Gemfile`

``` ruby
gem "markdown_videos"
```

and do

```
$ bundle install
```

## Usage

```ruby
require "markdown_videos" # if you don't use bundler

markdown_text = "![my youtube video](https://youtu.be/StTqXEQ2l-Y)"
html_rendered = MarkdownVideos.render(markdown_text)

puts html_rendered.to_s
```

```html
<iframe width="560" height="315" title="a title" src="https://www.youtube.com/embed/StTqXEQ2l-Y" frameborder="0" allowfullscreen></iframe>
```

You should use it before any [other Markdown renderer](https://github.com/vmg/redcarpet).

### Options

You can add optional parameters to `render`:
- `:wrapper` wraps the HTML embed element with the given string, `%s` must be present
- `:class_name` add a class attribute to HTML embed element

Example:
```ruby
MarkdownVideos.render(markdown_text, wrapper: '<p class="flex-video">%s</p>', class_name: "embed-video")
```


### Configure default options

Example: create an initializer file to override default options and make the renderer [Bootstrap](http://getbootstrap.com/components/#responsive-embed) friendly.

```ruby
MarkdownVideos.configure do |config|

  # For bootstrap css framework support by default
  config.wrapper = '<p class="embed-responsive embed-responsive-16by9">%s</p>'
  config.class_name = 'embed-responsive-item'

end
```

## Supported services

- Youtube
  - https://youtu.be/StTqXEQ2l-Y
  - https://www.youtube.com/watch?v=StTqXEQ2l-Y
  - https://www.youtube.com/embed/-sdTq0ZxZZg
  - URL parameters authorized: `:start`
- Vimeo
  - https://vimeo.com/152640853
  - https://player.vimeo.com/video/152640853

Can be `http` or `https` protocol

## Add your own service

You can make available your own services:

`my_awesome_service.rb`:

```ruby
module MarkdownVideos::Services

  class MyAwsomeService < ServiceBase

    def self.regexp
      /(https?:\/\/myaweso.me\/video\/([\w\-]{4,16})\??([\w\-\=]+)?)/
    end

    def width
      560
    end

    def height
      315
    end

    def url
      "https://player.myaweso.me/video/#{resource_id}"
    end

    def url_parameters
      [:start]
    end

  end

end
```

Look at the `lib/markdown_videos/services/service_base.rb` for more details.

## TODO

- Add more services

## Contribute

- Fork the project
- Clone the project locally `git clone ...`
- Add `upstream` repo `git remote add upstream https://github.com/capripot/markdown_videos.git`
- Create a new branch from master `git checkout -b my_contribution`
- Code
- `git rebase master` on your branch
- Make sure `bundle exec rubocop` and `bundle exec rspec` are passing
- Create a Pull Request against `upstream/master` on GitHub

### Want to add a service?

Do above process and also, more specifically:

- Add the service in `lib/markdown_videos/services.rb`
- Add tests to `lib/service_tests.rb`
- Name your branch `add_service_name_service` replacing `service_name`
- Add the service to this `README.md` file

## Boring legal stuff

Licensed under [LGPL v3.0](http://www.gnu.org/licenses/lgpl-3.0.en.html)

Copyright (c) 2016 [Ronan Potage](https://github.com/capripot) and contributors
