require 'radrails'
require 'radrails/terminal'

with_defaults :scope => "source.ruby.rails, source.yaml",
              :key_binding => "CONTROL+\\",
              :output => :discard do |bundle|
  command "Test All" do |cmd|
    cmd.invoke {|context|  RadRails::Terminal.open("rake test", context.project.to_dir.path) }
  end

  command "Test Functionals" do |cmd|
    cmd.invoke {|context|  RadRails::Terminal.open("rake test:functionals", context.project.to_dir.path) }
  end

  command "Test Integration" do |cmd|
    cmd.invoke {|context|  RadRails::Terminal.open("rake test:integration", context.project.to_dir.path) }
  end

  command "Test Plugins" do |cmd|
    cmd.invoke {|context|  RadRails::Terminal.open("rake test:plugins", context.project.to_dir.path) }
  end

  command "Test Recent" do |cmd|
    cmd.invoke {|context|  RadRails::Terminal.open("rake test:recent", context.project.to_dir.path) }
  end

  command "Test Uncommitted" do |cmd|
    cmd.invoke {|context|  RadRails::Terminal.open("rake test:uncommitted", context.project.to_dir.path) }
  end

  command "Test Units" do |cmd|
    cmd.invoke {|context|  RadRails::Terminal.open("rake test:units", context.project.to_dir.path) }
  end

end