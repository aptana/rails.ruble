require 'ruble'

# FIXME: this file is rife with textmate-isms!!!
  
command "Call Generate Script" do |cmd|
  cmd.key_binding = 'CONTROL+SHIFT+\\'
  cmd.scope = "source.ruby.rails, source.yaml, project.rails"
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    require 'rails_bundle_tools'
    require "rails/generator"
    
    Generator.setup
    if choice = Ruble.choose("Generate:", Generator.names.map { |name| Inflector.humanize name }, :title => "Rails Generator")
      arguments = Ruble::UI.request_string(
        :title => "#{Inflector.humanize Generator.generators[choice].name} Generator", 
        :default => Generator.generators[choice].default_answer,
        :prompt => Generator.generators[choice].question,
        :button1 => 'Generate'
      )

      if arguments
        options = ""
        rails_version = %x{rails -v}.chomp.scan(/[0-9][0-9\.]+/).first.to_i
        
        case choice
        when 0
          if rails_version < 2
            options = Ruble::UI.request_string(
             :title => "Scaffold Controller Name", 
             :prompt => "Name the new controller for the scaffold:",
             :button1 => 'Continue'
            )
            options = "'#{options}'"
          else
            options = Ruble::UI.request_string(
             :title => "Scaffold Model Attributes", 
             :default => "username:string",
             :prompt => "Name the attribute pairs for the model in the format 'name:type':",
             :button1 => 'Continue'
            )
            options = "#{options}"
          end
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

        require 'fileutils'
        FileUtils.cd proj_dir
        
        if File.exists?("script/rails")
          generate_cmd = "script/rails generate"
        else
          generate_cmd = "script/generate"
        end
        
        command = "#{generate_cmd} #{Generator.generators[choice].name} #{arguments} #{options}"
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
