require 'ruble'

command "Documentation for Word" do |cmd|
  cmd.key_binding = "CONTROL+H"
  cmd.scope = "source.ruby.rails, text.html.ruby, text.haml"
  cmd.input = :selection, :word

  # this is a hack - relies on embedded html view fetching page for you.
  cmd.output = :show_as_html
  cmd.invoke do |context|
    word = STDIN.read
    url = "http://apidock.com/rails/search/quick?query=" + word
    "<meta http-equiv='Refresh' content='0;URL=#{url}'>"
  end
end
