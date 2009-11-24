require 'radrails'

with_defaults { :scope => "source.ruby" }
do |bundle|

  snippet "assert(var = assigns(:var))" do |snippet|
    snippet.trigger = "asg"
    snippet.expansion = "assert(${1:var} = assigns(:${1}), "Cannot find @${1}")\n$0"
  end

  snippet "assert_difference" do |snippet|
    snippet.trigger = "asd"
    snippet.expansion = "assert_difference "${1:Model}.${2:count}", ${3:1} do\n$0\nend"
  end

  snippet "assert_no_difference" do |snippet|
    snippet.trigger = "asnd"
    snippet.expansion = "assert_no_difference "${1:Model}.${2:count}", ${3:1} do\n$0\nend"
  end

  snippet "assert_redirected_to (nested path plural)" do |snippet|
    snippet.trigger = "artnpp"
    snippet.expansion = "assert_redirected_to ${10:${2:parent}_${3:child}_path(${4:@}${5:${2}})}"
  end

  snippet "assert_redirected_to (nested path)" do |snippet|
    snippet.trigger = "artnp"
    snippet.expansion = "assert_redirected_to ${2:${12:parent}_${13:child}_path(${14:@}${15:${12}}, ${16:@}${17:${13}})}"
  end

  snippet "assert_redirected_to (path plural)" do |snippet|
    snippet.trigger = "artpp"
    snippet.expansion = "assert_redirected_to ${10:${2:model}s_path}"
  end

  snippet "assert_redirected_to (path)" do |snippet|
    snippet.trigger = "artp"
    snippet.expansion = "assert_redirected_to ${2:${12:model}_path(${13:@}${14:${12}})}"
  end

  snippet "assert_rjs" do |snippet|
    snippet.trigger = "asrj"
    snippet.expansion = "assert_rjs :${1:replace}, ${2:"${3:dom id}"}"
  end

  snippet "assert_select" do |snippet|
    snippet.trigger = "ass"
    snippet.expansion = "assert_select '${1:path}'${2:, :${3:text} =&gt; ${4:'${5:inner_html}'}}${6: do\n$0\nend"
  end

end
