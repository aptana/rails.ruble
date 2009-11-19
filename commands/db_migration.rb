require 'radrails'

with_defaults { :scope => "source.ruby.rails, source.yaml" ],
                :key_binding => [ :control, "|" ],
                :output => :show_as_html }
do |bundle|
  command "Clone Development DB to Test DB" do |cmd|
    cmd.invoke = "rake db:test:clone"
  end

  command "Dump DB to schema.rb" do |cmd|
    cmd.invoke = "rake db:schema:dump"
  end

  command "Load schema.rb to DB" do |cmd|
    cmd.key_binding = [ :control, "|" ]
  end

  # FIXME: generate quick migration?

  command "Load Fixtures to Test DB" do |cmd|
    cmd.invoke = "rake db:fixtures:load RAILS_ENV=test"
  end

  command "Load Fixtures to Development DB" do |cmd|
    cmd.invoke = "rake db:fixtures:load"
  end

  command "Migrate to Previous Version" do |cmd|
    cmd.invoke do |context|
      # FIXME: need to do this in RUBY directly
      current_schema_version="0" #`grep 'Schema\.define' "$TM_PROJECT_DIRECTORY/db/schema.rb" | ruby -e 'print $stdin.read.scan(/\d+/).first'`
      exec_cmd "rake db:migrate:down VERSION=#{current_schema_version}"
    end
  end

  # Migrate to version is in textmate, but sucks. we can do better with a gui...

  command "Migrate to Current" do |cmd|
    cmd.invoke = "rake db:migrate"
  end

  command "Redo Last Migration" do |cmd|
    cmd.invoke = "rake db:migrate:redo"
  end

end
