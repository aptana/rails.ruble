require 'radrails'

with_defaults :scope => "source.ruby.rails, source.yaml",
              :key_binding => [ :control, "\\" ],
              :output => :show_as_html do |bundle|
  command "Test All" do |cmd|
    cmd.invoke = "rake test"
  end

  command "Test Functionals" do |cmd|
    cmd.invoke = "rake test:functionals"
  end

  command "Test Integration" do |cmd|
    cmd.invoke = "rake test:integration"
  end

  command "Test Plugins" do |cmd|
    cmd.invoke = "rake test:plugins"
  end

  command "Test Recent" do |cmd|
    cmd.invoke = "rake test:recent"
  end

  command "Test Uncommitted" do |cmd|
    cmd.invoke = "rake test:uncommitted"
  end

  command "Test Units" do |cmd|
    cmd.invoke = "rake test:units"
  end

end