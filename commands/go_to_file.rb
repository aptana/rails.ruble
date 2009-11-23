require 'radrails'

require 'rails/command_go_to_file'

with_defaults { :key_binding => [ :option, :shift, :command, :down_arrow ], :output => :show_as_tooltip }
do |bundle|

  command "Go to Controller" do |cmd|
    cmd.scope = "text.html.ruby, source.ruby.rails.embedded.html, meta.rails.helper, meta.rails.functional_test, source.js, source.css, source.yaml, meta.rails.model, meta.rails.unit_test, text.haml"
    cmd.invoke { CommandGoToFile.alternate(:controller) }
  end

  command "Go to File" do |cmd|
    cmd.scope = "source.ruby.rails, text.html.ruby, source.ruby.rails.embedded.html, source.yaml, text.haml, source.css, source.js, source.sass"
    cmd.invoke { CommandGoToFile.alternate(nil) }
  end

  command "Go to File on This Line" do |cmd|
    cmd.scope = "source.ruby.rails, text.html.ruby, source.ruby.rails.embedded.html, text.haml"
    cmd.invoke { CommandGoToFile.on_current_line }
  end

  command "Go to Fixture" do |cmd|
    cmd.scope = "meta.rails.controller, meta.rails.helper, meta.rails.model, meta.rails.unit_test, meta.rails.functional_test"
    cmd.invoke { CommandGoToFile.alternate(:fixture) }
  end

  command "Go to Functional Test" do |cmd|
    cmd.scope = "meta.rails.controller, meta.rails.helper, meta.rails.model, source.yaml, meta.rails.unit_test"
    cmd.invoke { CommandGoToFile.alternate(:functional_test) }
  end

  command "Go to Helper" do |cmd|
    cmd.scope = "text.html.ruby, source.ruby.rails.embedded.html, meta.rails.controller, meta.rails.model, meta.rails.unit_test, meta.rails.functional_test, text.haml"
    cmd.invoke { CommandGoToFile.alternate(:helper) }
  end

  command "Go to JavaScript" do |cmd|
    cmd.scope = "text.html.ruby, source.ruby.rails.embedded.html, meta.rails.controller, meta.rails.helper, text.haml"
    cmd.invoke { CommandGoToFile.alternate(:javascript) }
  end

  command "Go to Model" do |cmd|
    cmd.scope = "text.html.ruby, source.ruby.rails.embedded.html, meta.rails.helper, meta.rails.unit_test, source.js, source.css, source.yaml, meta.rails.controller, meta.rails.functional_test, text.haml"
    cmd.invoke { CommandGoToFile.alternate(:model) }
  end

  command "Go to Stylesheet" do |cmd|
    cmd.scope = "text.html.ruby, source.ruby.rails.embedded.html, meta.rails.controller, meta.rails.helper, text.haml"
    cmd.invoke { CommandGoToFile.alternate(:stylesheet) }
  end

  command "Go to Unit Test" do |cmd|
    cmd.scope = "meta.rails.controller, meta.rails.helper, meta.rails.model, meta.rails.functional_test, source.yaml"
    cmd.invoke { CommandGoToFile.alternate(:unit_test) }
  end

  command "Go to View" do |cmd|
    cmd.scope = "meta.rails.controller, meta.rails.mailer, source.js, source.css"
    cmd.invoke { CommandGoToFile.alternate(:view) }
  end

end
