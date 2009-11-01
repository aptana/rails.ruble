require 'radrails'

RadRails.bundle("MyBundle").snippet "<= Fixtures.identify(:symbol) >" do |snippet|
  snippet.trigger = "fi"
  snippet.expansion = "${TM_RAILS_TEMPLATE_START_RUBY_EXPR}Fixtures.identify(:${1:name})${TM_RAILS_TEMPLATE_END_RUBY_EXPR}$0"
  snippet.scope = :source_yaml
end
