require 'radrails'

snippet "accepts_nested_attributes_for" do |snippet|
  snippet.trigger = "anaf"
  snippet.expansion = "accepts_nested_attributes_for :${1:association_name}${2:${3:, :allow_destroy =&gt; true}${4:, :reject_if =&gt; proc { |obj| ${5:obj.blank?} \}}}\n"
  snippet.scope = [ :source_ruby_rails ]
end
