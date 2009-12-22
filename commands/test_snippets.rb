require 'radrails'

with_defaults :scope => "source.ruby.rails" do |bundle|

  snippet "assert_redirected_to" do |snippet|
    snippet.trigger = "art"
    snippet.expansion = "assert_redirected_to ${2::action => \"${1:index}\"}"
  end

  snippet "assert_response" do |snippet|
    snippet.trigger = "asre"
    snippet.expansion = "assert_response :${1:success}, @response.body$0"
  end

  snippet "test do..end" do |snippet|
    snippet.trigger = "test"
    snippet.expansion = "test \"${1:something interesting}\" do\n\t\t$0\n\tend"
  end

  snippet "verify — render" do |snippet|
    snippet.trigger = "verify"
    snippet.expansion = "verify :only => [:$1], :method => :post, :render => {:status => 500, :text => \"use HTTP-POST\"}\n"
  end

  snippet "verify — redirect" do |snippet|
    snippet.trigger = "verify"
    snippet.expansion = "verify :only => [:$1], :session => :user, :params => :id, :redirect_to => {:action => '${2:index}'}\n"
  end

  snippet "<%= Fixtures.identify(:symbol) %>" do |snippet|
    snippet.trigger = "fi"
    snippet.expansion = "${TM_RAILS_TEMPLATE_START_RUBY_EXPR}Fixtures.identify(:${1:name})${TM_RAILS_TEMPLATE_END_RUBY_EXPR}$0"
    snippet.scope = :source_yaml
  end

end