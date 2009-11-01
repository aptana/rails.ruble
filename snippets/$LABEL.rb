require 'radrails'

RadRails.bundle("MyBundle").snippet "$LABEL" do |snippet|
  snippet.trigger = "$L"
  snippet.expansion = "\$LABEL"
  snippet.scope = :source_yaml
end
