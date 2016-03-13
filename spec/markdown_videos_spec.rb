require "markdown_videos"
require "service_tests"

describe MarkdownVideos do

  context "Image syntax is rendered" do

    def markdown_string(alt_text, link)
      "![#{alt_text}](#{link})"
    end

    describe "with string containing one element" do

      MarkdownVideos::SERVICE_TESTS.each do |service, tests|
        tests.each do |test|
          test[:alt_text] ||= "a title"

          it "should render #{service} HTML" do
            rendered_text = MarkdownVideos.render(markdown_string(test[:alt_text], test[:url]))

            expect(rendered_text).to include test[:html]
          end
        end
      end

    end

    describe "with string containing multiple elements" do

      it "should render all HTML" do
        markdown_text = []
        expected_html = []

        MarkdownVideos::SERVICE_TESTS.each do |service, tests|
          markdown_text << tests.map { |test| markdown_string(test[:alt_text], test[:url]) }.join("\n")
          expected_html << tests.map { |test| test[:html] }.join("\n")
        end

        rendered_text = MarkdownVideos.render(markdown_text.join("\n"))

        expect(rendered_text).to include expected_html.join("\n")
      end

    end

  end

end
