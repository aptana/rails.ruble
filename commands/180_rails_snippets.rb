require 'radrails'

snippet "form_tag" do |snippet|
  snippet.trigger = "ft"
  # FIXME We don't support nested tab stops
  snippet.expansion = "form_tag(${1::action => \"${5:update}\"}${6:, {:${8:class} => \"${9:form}\"}}) do\n\t$0\n"
  snippet.scope = [ :text_html_ruby, :text_haml ]
end
