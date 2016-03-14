describe MarkdownVideos do

  it "should allow defaults to be set via a block" do

    MarkdownVideos.configure do |config|
      config.wrapper = "<p>%s</p>"
      config.classname = "classname"
    end

    expect(MarkdownVideos.defaults.wrapper).to eq "<p>%s</p>"
    expect(MarkdownVideos.defaults.classname).to eq "classname"
  end

  it "should raise an error if wrapper is defined but doesnt contain `%s`" do
    MarkdownVideos.configure do |config|
      expect { config.wrapper = "<p></p>" }.to raise_error "Wrapper needs to include `%s`"
      expect { config.wrapper = "<p>%s</p>" }.not_to raise_error
    end
  end

  after(:example) do
    # reset config
    MarkdownVideos.configure do |config|
      config.wrapper = nil
      config.classname = nil
    end
  end

end
