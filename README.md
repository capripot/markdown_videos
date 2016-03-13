![Travis CI Test status](https://travis-ci.org/capripot/markdown-videos.svg)

## Markdown Videos

Have you ever wished the markdown image syntax would be able to render more than just images?

`markdown-videos` helps you with that dream, and renders automatically your markdown image syntax elements to the appropriate embed video service HTML markup.

### Installation

`gem install markdown-videos`

or add the gem to your `Gemfile`

`gem "markdown-videos"`

and do

`bundle install`

### Usage

```ruby
require "markdown_videos"

markdown_text = "![my youtube video](https://youtu.be/StTqXEQ2l-Y)"
html_rendered = MarkdownVideos.render(markdown_text)
```

`html_rendered.to_s`:

```html
<iframe width="560" height="315" title="a title" src="https://www.youtube.com/embed/StTqXEQ2l-Y" frameborder="0" allowfullscreen></iframe>
```

### Supported services

- Youtube
  - https://youtu.be/StTqXEQ2l-Y
  - https://www.youtube.com/watch?v=StTqXEQ2l-Y
  - https://www.youtube.com/embed/-sdTq0ZxZZg
- Vimeo
  - https://vimeo.com/152640853
  - https://player.vimeo.com/video/152640853

Can be `http` or `https` protocol

### Contribute

- Fork the project
- Clone the project locally `git clone ...`
- Add `upstream` repo `git remote add upstream https://github.com/capripot/markdown-videos.git`
- Create a new branch from master `git checkout -b my_contribution`
- Code
- Eventually `git rebase master` on your branch
- Make sure `rubocop` and `rspec` are passing
- Create a Pull Request against `upstream/master`

#### Want to add a service?

- Add your service in `lib/markdown_videos/services.rb`
- Add tests to `lib/sqervice_tests.rb`
- Name your branch `add_service_name_service` replacing `service_name`

### Boring stuff

Licensed under [LGPL v3.0](http://www.gnu.org/licenses/lgpl-3.0.en.html)

Copyright 2016 capripot and contributors
