require 'radrails'

RadRails.bundle("MyBundle").snippet "after_create" do |snippet|
  snippet.trigger = "aftc"
  snippet.expansion = "after_create "
  snippet.scope = [ :source_ruby_rails ]
end
