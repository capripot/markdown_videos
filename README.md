# Markdown Videos

[![Travis CI Test status](https://travis-ci.org/capripot/markdown-videos.svg)](https://travis-ci.org/capripot/markdown-videos)

Have you ever wished the [markdown image syntax](https://daringfireball.net/projects/markdown/syntax#img) would be able to render more than just images?

`markdown-videos` helps you with that dream, and renders automatically your markdown image syntax elements to the appropriate embed video service HTML markup.

## Installation

```
$ gem install markdown-videos
```

or add it to your `Gemfile`

``` ruby
gem "markdown-videos"
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

## TODO

- Add wrapper support
- Add more services

## Contribute

- Fork the project
- Clone the project locally `git clone ...`
- Add `upstream` repo `git remote add upstream https://github.com/capripot/markdown-videos.git`
- Create a new branch from master `git checkout -b my_contribution`
- Code
- `git rebase master` on your branch
- Make sure `bundle exec rubocop` and `bundle exec rspec` are passing
- Create a Pull Request against `upstream/master` on GitHub

### Want to add a service?

- Add your service in `lib/markdown_videos/services.rb`
- Add tests to `lib/sqervice_tests.rb`
- Name your branch `add_service_name_service` replacing `service_name`
- Add your service to this `README.md` file

## Boring legal stuff

Licensed under [LGPL v3.0](http://www.gnu.org/licenses/lgpl-3.0.en.html)

Copyright (c) 2016 [Ronan Potage](https://github.com/capripot) and contributors
