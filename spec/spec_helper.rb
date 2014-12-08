Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), "../lib/")) + "/**/*.rb"].each do |file|
  require file
end
