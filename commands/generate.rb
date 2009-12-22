require 'rails_bundle_tools'
require 'fileutils'
require File.dirname(__FILE__) + "/../lib/rails/generator"

require 'radrails'

# FIXME: this file is rife with textmate-isms!!!

command "Call Generate Script" do |cmd|
  cmd.scope = "source.ruby.rails, source.yaml"
  cmd.output = :discard

  # Look for (created) files and return an array of them
  def files_from_generator_output(output, type = 'create')
    output.to_a.map { |line| line.scan(/#{type}\s+([^\s]+)$/).flatten.first }.compact.select { |f| File.exist?(f) and !File.directory?(f) }
  end

  cmd.invoke do |context|
    Generator.setup

    if choice = RadRails.choose("Generate:", Generator.names.map { |name| Inflector.humanize name }, :title => "Rails Generator")
      arguments = RadRails::UI.request_string(
        :title => "#{Inflector.humanize Generator.generators[choice].name} Generator", 
        :default => Generator.generators[choice].default_answer,
        :prompt => Generator.generators[choice].question,
        :button1 => 'Generate'
      )

      if arguments
        options = ""

        case choice
        when 0
          options = RadRails::UI.request_string(
            :title => "Scaffold Controller Name", 
            :prompt => "Name the new controller for the scaffold:",
            :button1 => 'Continue'
          )
          options = "'#{options}'"
        when 1
          options = RadRails::UI.request_string(
            :title => "Controller Actions", 
            :default => "index new create edit update destroy",
            :prompt => "List any actions you would like created for the controller:",
            :button1 => 'Create'
          )
        end

        # add the --svn option, if needed
        proj_dir = RadRails.current_project.root_dir
        if proj_dir and File.exist?(File.join(proj_dir, ".svn"))
          options << " --svn"
        end
        if proj_dir and File.exist?(File.join(proj_dir, ".git"))
          options << " --git"
        end

        FileUtils.cd proj_dir
        command = "script/generate #{Generator.generators[choice].name} #{arguments} #{options}"
        $logger.debug "Command: #{command}"

        output = ruby(command)
        $logger.debug "Output: #{output}"
        RadRails.rescan_project
        files = files_from_generator_output(output)
        files.each { |f| RadRails.open(File.join(proj_dir, f)) }

        RadRails::UI.simple_notification(
          :title => 'Generator Complete',
          :summary => "Done generating #{Generator.generators[choice].name}",
          :log => output
        )
      end
    end
  end
end
