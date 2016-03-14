module MarkdownVideos

  class Configuration

    attr_accessor :wrapper,
                   :classname

    # if defined, needs to contain `%s` where HTML markup should be included
    # e.g.: WRAPPER = '<p class="embed-responsive embed-responsive-16by9">%s</p>'.freeze
    def wrapper
      @wrapper || nil
    end

    def wrapper=(wrapper)
      raise "Wrapper needs to include `%s`" unless wrapper.nil? || wrapper['%s']
      @wrapper = wrapper
    end

    # extra classname(s) added to embed HTML markup
    def classname
      @classname || nil
    end

  end

end
