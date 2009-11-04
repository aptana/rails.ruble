require 'radrails'

snippet "form_tag" do |snippet|
  snippet.trigger = "ft"
  snippet.expansion = "${TM_RAILS_TEMPLATE_START_RUBY_INLINE}form_tag(${1::action =&gt; "${5:update}"}${6:, {:${8:class} =&gt; "${9:form}"\}}) do${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
  $0
${TM_RAILS_TEMPLATE_END_RUBY_BLOCK}"
  snippet.scope = [ :text_html_ruby, :text_haml ]
end
