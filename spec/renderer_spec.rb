require "markdown_videos"
require "service_tests"

describe MarkdownVideos do

  context "Image syntax is rendered" do

    def markdown_string(alt_text, link)
      "![#{alt_text}](#{link})"
    end

    describe "with string containing one element" do

      it "should keep string as it is if service is not supported" do
        rendered_text = MarkdownVideos.render(markdown_string("a title", "http://i.giphy.com/m7Xm0aWwu3LFe.gif"))

        expect(rendered_text).to eq "![a title](http://i.giphy.com/m7Xm0aWwu3LFe.gif)"
      end

      it "it should strip spaces arround given url" do
        test = MarkdownVideos::SERVICE_TESTS[:youtube].first

        rendered_text = MarkdownVideos.render(markdown_string(test[:alt_text], " #{test[:url]} "))

        expect(rendered_text).to include test[:html]
      end

      MarkdownVideos::SERVICE_TESTS.each do |service, tests|
        tests.reject { |test| test.keys.include?(:class_name) }.each do |test|
          test[:alt_text] ||= "a title"

          it "should render #{service} HTML" do
            rendered_text = MarkdownVideos.render(markdown_string(test[:alt_text], test[:url]))

            expect(rendered_text).to include test[:html]
          end
        end
      end

    end

    describe "with string containing multiple elements" do

      it "should render them all in HTML" do
        markdown_text = []
        expected_html = []

        MarkdownVideos::SERVICE_TESTS.each do |service, tests|
          tests.reject! { |test| test.keys.include?(:class_name) }
          markdown_text << tests.map { |test| markdown_string(test[:alt_text], test[:url]) }.join("\n")
          expected_html << tests.map { |test| test[:html] }.join("\n")
        end

        rendered_text = MarkdownVideos.render("Some surrounding text #{markdown_text.join("\n")}")

        expect(rendered_text).to include "Some surrounding text #{expected_html.join("\n")}"
      end

    end

    describe "with wrapper option" do
      it "should produce HTML markup wrapped in the given wrapper option" do
        wrapper = '<p class="flex-video">%s</p>'

        test = MarkdownVideos::SERVICE_TESTS[:youtube].first

        rendered_text = MarkdownVideos.render(markdown_string(test[:alt_text], test[:url]), wrapper: wrapper)

        expect(rendered_text).to include "<p class=\"flex-video\">#{test[:html]}</p>"
      end
    end

    describe "with class option" do

      class_name_tests = {}

      MarkdownVideos::SERVICE_TESTS.each do |service, tests|
        class_name_tests[service] = tests.select { |test| test.keys.include?(:class_name) }
      end

      it "At least one test of class_name per service is required" do
        expect(class_name_tests.reject { |service, v| v.empty? }.keys).to eq MarkdownVideos::SERVICE_TESTS.keys
      end

      class_name_tests.each do |service, tests|
        tests.each do |test|
          test[:alt_text] ||= "a title"

          it "should render #{service} HTML with class_name #{test[:class_name]}" do
            rendered_text = MarkdownVideos.render(markdown_string(test[:alt_text], test[:url]), class_name: test[:class_name])

            expect(rendered_text).to include test[:html]
          end
        end
      end

    end

  end

end
