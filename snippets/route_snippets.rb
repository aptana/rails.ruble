require 'radrails'

with_defaults { :scope => "text.html.ruby, text.haml" }
do |bundle|

  snippet "link_to (action)" do |snippet|
    snippet.trigger = "lia"
    snippet.expansion = "link_to \"${1:link text...}\", :action => \"${2:index}\""
  end

  snippet "link_to (action, id)" do |snippet|
    snippet.trigger = "liai"
    snippet.expansion = "link_to \"${1:link text...}\", :action => \"${2:index}\", :id => ${3:@item}"
  end

  snippet "link_to (controller)" do |snippet|
    snippet.trigger = "lic"
    snippet.expansion = "link_to \"${1:link text...}\", :controller => \"${2:items}\""
  end

  snippet "link_to (controller, action)" do |snippet|
    snippet.trigger = "lica"
    snippet.expansion = "link_to \"${1:link text...}\", :controller => \"${2:items}\", :action => ${3:@index}"
  end

  snippet "link_to (conroller, action, id)" do |snippet|
    snippet.trigger = "licai"
    snippet.expansion = "link_to \"${1:link text...}\", :controller => \"${2:items}\", :action => ${3:@index}, :id => ${4:@item}"
  end

  snippet "link_to (nested path plural)" do |snippet|
    snippet.trigger = "linpp"
    snippet.expansion = "link_to ${1:\"${2:link text...}\"}, ${3:${10:parent}_${11:child}_path(${12:@}${13:${10}})}"
  end

  snippet "link_to (nested path)" do |snippet|
    snippet.trigger = "linp"
    snippet.expansion = "link_to ${1:\"${2:link text...}\"}, ${3:${12:parent}_${13:child}_path(${14:@}${15:${12}}, ${16:@}${17:${13}})}"
  end

  snippet "link_to (path plural)" do |snippet|
    snippet.trigger = "lipp"
    snippet.expansion = "link_to ${1:\"${2:link text...}\"}, ${3:${4:model}s_path}"
  end

  snippet "link_to (path)" do |snippet|
    snippet.trigger = "lip"
    snippet.expansion = "link_to ${1:\"${2:link text...}\"}, ${3:${12:model}_path(${13:@}${14:${12}})}"
  end

  snippet "link_to model" do |snippet|
    snippet.trigger = "lim"
    snippet.expansion = "link_to ${1:model}.${2:name}, ${3:${4:$1}_path(${14:$1})}"
  end

end

with_defaults { :scope => "source.ruby.rails" }
do |bundle|

  snippet "redirect_to (action)" do |snippet|
    snippet.trigger = "rea"
    snippet.expansion = "redirect_to action => \"${1:index}\""
  end

  snippet "redirect_to (action, id)" do |snippet|
    snippet.trigger = "reai"
    snippet.expansion = "redirect_to :action => \"${1:index}\", :id => ${0:@item}"
  end

  snippet "redirect_to (controller)" do |snippet|
    snippet.trigger = "rec"
    snippet.expansion = "redirect_to :controller => \"${1:items}\""
  end

  snippet "redirect_to (controller, action)" do |snippet|
    snippet.trigger = "reca"
    snippet.expansion = "redirect_to :controller => \"${1:items}\", :action => ${2:list}"
  end

  snippet "redirect_to (controller, action, id)" do |snippet|
    snippet.trigger = "recai"
    snippet.expansion = "redirect_to :controller => \"${1:items}\", :action => ${2:show}, :id => ${0:@item}"
  end

  snippet "redirect_to (nested path plural)" do |snippet|
    snippet.trigger = "renpp"
    snippet.expansion = "redirect_to(${2:${10:parent}_${11:child}_path(${12:@}${13:${10}})})"
  end

  snippet "redirect_to (nested path)" do |snippet|
    snippet.trigger = "renp"
    snippet.expansion = "redirect_to(${2:${12:parent}_${13:child}_path(${14:@}${15:${12}}, ${16:@}${17:${13}})})"
  end

  snippet "redirect_to (path plural)" do |snippet|
    snippet.trigger = "repp"
    snippet.expansion = "redirect_to(${2:${10:model}s_path})"
  end

  snippet "redirect_to (path)" do |snippet|
    snippet.trigger = "rep"
    snippet.expansion = "redirect_to(${2:${12:model}_path(${13:@}${14:${12}})})"
  end

  snippet "redirect_to :back" do |snippet|
    snippet.trigger = "reb"
    snippet.expansion = "redirect_to :back"
  end

end

with_defaults { :scope => "meta.rails.routes" }
do |bundle|

  snippet "map.catch_all" do |snippet|
    snippet.trigger = "mapca"
    snippet.expansion = "${1:map}.catch_all \"*${2:anything}\", :controller =&gt; \"${3:default}\", :action =&gt; \"${4:error}\"\n"
  end

  snippet "map.named_route" do |snippet|
    snippet.trigger = "map"
    snippet.expansion = "${1:map}.${2:connect} '${3::controller/:action/:id}'"
  end

  snippet "map.resource" do |snippet|
    snippet.trigger = "mapr"
    snippet.expansion = "${1:map}.resource :${2:resource}${10: do |${11:$2}|\n\t\t$0\n\tend}"
  end

  snippet "map.resources" do |snippet|
    snippet.trigger = "maprs"
    snippet.expansion = "${1:map}.resources :${2:resource}${10: do |${11:$2}|\n\t\t$0\n\tend}"
  end

  snippet "map.with_options" do |snippet|
    snippet.trigger = "mapwo"
    snippet.expansion = "${1:map}.with_options :${2:controller} =&gt; '${3:thing}' do |${4:$3}|\n\t\t$0\n\tend\n"
  end

end
