require 'radrails'

command "Documentation for Word" do |cmd|
  cmd.key_binding = "M1+H" ]
  # if selection isn't empty, use it, otherwise use the word containing the current selection
  cmd.input = [ :selection, :word ]
  cmd.output = :show_as_html
  cmd.scope = "source.ruby.rails, text.html.ruby, text.haml"
  cmd.invoke do |context|
    # stdout in this block is directed to cmd.output (available here read-only as context.output)
    # environment variables are available by using context as a hash, a la TextMate
    
    # context.input will figure out what to pass in correctly based on command settings
    url = "http://apidock.com/rails/search/quick?query=" + context.input

    # this is a hack - relies on embedded html view fetching page for you.
    puts "&lt;meta http-equiv='Refresh' content='0;URL=#{url}'&gt;"

    # or we could just skip all the output specification and do something nicer for this case:
    context.browser.open url, :new_window => true, :title => "Documentation for #{context.selection}"
  end
end
