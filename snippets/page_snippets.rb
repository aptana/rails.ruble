require 'radrails'

with_defaults { :scope => "source.ruby.rails.rjs" }
do |bundle|

  snippet "page.hide (*ids)" do |snippet|
    snippet.trigger = "hide"
    snippet.expansion = "page.hide ${1:\"${2:id(s)}\"}"
  end

  snippet "page.insert_html (position, id, partial)" do |snippet|
    snippet.trigger = "ins"
    snippet.expansion = "page.insert_html :${1:top}, ${2:\"${3:id}\"}, :${4:partial => \"${5:template}\"}"
  end

  snippet "page.replace (id, partial)" do |snippet|
    snippet.trigger = "rep"
    snippet.expansion = "page.replace ${1:\"${2:id}\"}, :${3:partial => \"${4:template}\"}"
  end

  snippet "page.replace_html (id, partial)" do |snippet|
    snippet.trigger = "reph"
    snippet.expansion = "page.replace_html ${1:\"${2:id}\"}, :${3:partial => \"${4:template}\"}"
  end

  snippet "page.show (*ids)" do |snippet|
    snippet.trigger = "show"
    snippet.expansion = "page.show ${1:\"${2:id(s)}\"}"
  end

  snippet "page.toggle (*ids)" do |snippet|
    snippet.trigger = "tog"
    snippet.expansion = "page.toggle ${1:\"${2:id(s)}\"}"
  end

  snippet "page.visual_effect (effect, id)" do |snippet|
    snippet.trigger = "vis"
    snippet.expansion = "page.visual_effect :${1:toggle_slide}, ${2:\"${3:DOM ID}\"}"
  end

end
