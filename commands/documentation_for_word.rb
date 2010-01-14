require 'radrails'
# FIXME Scope matching is borken so this never seems to be enabled
command "Documentation for Word" do |cmd|
  cmd.key_binding = "CONTROL+H"
  # if selection isn't empty, use it, otherwise use the word containing the current selection
  cmd.input = [ :selection, :word ]
  cmd.output = :show_as_html
  cmd.scope = "source.ruby.rails, text.html.ruby, text.haml"
  cmd.invoke do |context|
    # context.in will figure out what to pass in correctly based on command settings
    url = "http://apidock.com/rails/search/quick?query=" + context.in.read

    # this is a hack - relies on embedded html view fetching page for you.
    "<meta http-equiv='Refresh' content='0;URL=#{url}'>"
  end
end
