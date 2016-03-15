module MarkdownVideos

  # This file `require` the ServiceBase class
  # and all `_service` files present in services folder

  require_relative "services/service_base"

  Dir[File.expand_path("../services/*_service.rb", __FILE__)].each do |path|
    require path
  end

  # Build a static list of available Service classes
  service_classes = MarkdownVideos::Services.constants.select do |class_name|
    MarkdownVideos::Services.const_get(class_name).is_a?(Class) && class_name =~ /Service$/
  end

  SERVICES = service_classes.map do |class_name|
    Object.const_get("MarkdownVideos::Services::#{class_name}")
  end

end
