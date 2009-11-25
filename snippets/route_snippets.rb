require 'radrails'

with_defaults { :scope => "source.ruby.rails" }
do |bundle|

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
