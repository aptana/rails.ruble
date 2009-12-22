require 'radrails'

with_defaults :scope => "source.ruby, meta.rails.controller" do |bundle|

  snippet "respond_to" do |snippet|
    snippet.trigger = "rest"
    snippet.expansion = "respond_to do |wants|\n\t\twants.${1:html}${2: { $0 \}}\n\tend"
  end

  command "respond_to (html)" do |cmd|
    cmd.key_binding = [ :command, :shift, "H"]

    # if selection isn't empty, use it, otherwise use the word containing the current selection
    cmd.input = [ :selection, :word ]

    cmd.output = :insert_as_snippet

    cmd.invoke do |context|
      puts "respond_to do |wants|\n\t\twants.html do\n\t\t\t" +
            context.input +
            "\n\t\tend\n\t\twants.${1:js} { $0 }\n\tend"
    end
  end

  snippet "wants.format" do |snippet|
    snippet.trigger = "wants"
    snippet.expansion = "wants.${1:js|xml|html}${2: { $0 \}}"
  end

end
