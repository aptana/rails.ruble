require 'radrails'

# its ruby, so this just addscommands/snippets in bundle (or replaces those with same name)
# many ruby files could add to a single bundle
RadRails.bundle "MyBundle" do |rr|
  rr.snippet "Create Column in Table" do |snippet|
    snippet.trigger = "mcol"
    snippet.expansion = "t.column ${1:title}, :${2:string}\n$0"
    snippet.scope = :source_ruby_rails
  end

  # short form of same snippet
  rr.snippet "Create Column in Table", "mcol", "t.column ${1:title}, :${2:string}\n$0", :source_ruby_rails

  # or a scoped form so you don't need to specify scopes all the time...
  rr.with_scope :source_ruby_rails do |rr|
    rr.snippet "Create Column in Table", "mcol", "t.column ${1:title}, :${2:string}\n$0"

    # or we could get really wild, but no easy way to name snippets and you would *have* to use with_scope...
    rr.add_snippets = {
      :fun    => "vino vino vino",
      :mcol   => "t.column ${1:title}, :${2:string}\n$0",
      :tcol   => "lorem ipsum dorem"
    }
  end
end
