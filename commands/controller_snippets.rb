require 'radrails'

with_defaults :scope => "meta.rails.controller" do |bundle|

  snippet "respond_to" do |snippet|
    snippet.trigger = "rest"
    snippet.expansion = "respond_to do |wants|\n\t\twants.${1:html}${2: { $0 \}}\n\tend"
  end

  snippet "respond_to (html)" do |cmd|
    snippet.key_binding = [ :command, :shift, "H"]
    # FIXME: how do we substitute $TM_SELECTED_TEXT into the template on the fly?
    snippet.expansion = "respond_to do |wants|\n\t\twants.html do\n\t\t\t$TM_SELECTED_TEXT\n\t\tend\n\t\twants.${1:js} { $0 }\n\tend"
  end

  snippet "wants.format" do |snippet|
    snippet.trigger = "wants"
    snippet.expansion = "wants.${1:js|xml|html}${2: { $0 \}}"
  end

end
