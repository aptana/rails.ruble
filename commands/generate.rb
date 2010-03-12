require 'ruble'

require 'rails_bundle_tools'
require 'fileutils'
require "rails/generator"

# FIXME: this file is rife with textmate-isms!!!
  
command "Call Generate Script" do |cmd|
  cmd.key_binding = 'CONTROL+SHIFT+\\'
  cmd.scope = "source.ruby.rails, source.yaml"
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    Generator.setup
    # FIXME This doesn't work with Rails 3!
    if choice = Ruble.choose("Generate:", Generator.names.map { |name| Inflector.humanize name }, :title => "Rails Generator")
      arguments = Ruble::UI.request_string(
        :title => "#{Inflector.humanize Generator.generators[choice].name} Generator", 
        :default => Generator.generators[choice].default_answer,
        :prompt => Generator.generators[choice].question,
        :button1 => 'Generate'
      )

      if arguments
        options = ""

        case choice
        when 0
          options = Ruble::UI.request_string(
            :title => "Scaffold Controller Name", 
            :prompt => "Name the new controller for the scaffold:",
            :button1 => 'Continue'
          )
          options = "'#{options}'"
        when 1
          options = Ruble::UI.request_string(
            :title => "Controller Actions", 
            :default => "index new create edit update destroy",
            :prompt => "List any actions you would like created for the controller:",
            :button1 => 'Create'
          )
        end

        # add the --svn option, if needed
        proj_dir = Ruble.project_directory
        if proj_dir and File.exist?(File.join(proj_dir, ".svn"))
          options << " --svn"
        end
        if proj_dir and File.exist?(File.join(proj_dir, ".git"))
          options << " --git"
        end

        FileUtils.cd proj_dir
        # TODO query if project is rails 3.0+ and if so, then run "rails generate ..."
        command = "script/generate #{Generator.generators[choice].name} #{arguments} #{options}"
        Ruble::Logger.trace "Command: #{command}"

        output = ruby(command)
        Ruble::Logger.trace "Output: #{output}"
        Ruble.rescan_project
        files = Generator.files_from_generator_output(output)
        files.each { |f| Ruble.open(File.join(proj_dir, f)) }

        Ruble::UI.simple_notification(
          :title => 'Generator Complete',
          :summary => "Done generating #{Generator.generators[choice].name}",
          :log => output
        )
      end
    end
  end
end
