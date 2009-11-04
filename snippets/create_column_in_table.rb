require 'radrails'

# its ruby, so this just addscommands/snippets in bundle (or replaces those with same name)
# many ruby files could add to a single bundle
snippet "Create Column in Table" do |snippet|
  snippet.trigger = "mcol"
  snippet.expansion = "t.column ${1:title}, :${2:string}\n$0"
  snippet.scope = :source_ruby_rails
end

# short form of same snippet
snippet "Create Column in Table", "mcol", "t.column ${1:title}, :${2:string}\n$0", :source_ruby_rails
