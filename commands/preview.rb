require 'ruble'

command "Preview" do |cmd|
  cmd.key_binding = "M1+M2+P"
  cmd.scope = "source.ruby.rails, text.html.ruby, text.haml"
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    url = context.project.root_url
    project_relative_path = ENV['TM_FILEPATH'].sub(/^#{Regexp.escape(ENV['TM_PROJECT_DIRECTORY'])}\//, '')
    if project_relative_path.end_with? ".html"
      # Simple HTML Preview
      if ENV['TM_PROJECT_SITEURL']
        url = "#{ENV['TM_PROJECT_SITEURL']}" + project_relative_path
      else
        url = "file://#{ENV['TM_FILEPATH']}"
      end    
      context.browser.open(url, :browser => :default)
    else
      # TODO Grab mapper like "rake routes" does and then reverse engineer the controller and action into an URL!
      require 'rails/rails_path'
      path = RailsPath.new(project_relative_path)
      url += path.controller_name
      case path.action_name.downcase.to_sym
      when :show, :update, :destroy
        url += "/1"
      when :edit
        url += "/1/edit"
      when :index, :create, :list
        url # No changes, just hit controller plural name
      else # :new, 
        url += "/#{path.action_name}"
      end       
      context.browser.open(url, :browser => :default)
    end
  end
end
