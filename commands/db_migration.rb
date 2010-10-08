require 'ruble'

with_defaults :scope => "source.ruby.rails, source.yaml",
              :key_binding => "M1+M2+\\",
              :output => :discard do |bundle|
  require 'ruble/terminal'
  
  command "Clone Development DB to Test DB" do |cmd|
    cmd.invoke {|context|  Ruble::Terminal.open("rake db:test:clone", context.project.to_dir.path) }
  end

  command "Dump DB to schema.rb" do |cmd|
    cmd.invoke {|context|  Ruble::Terminal.open("rake db:schema:dump", context.project.to_dir.path) }
  end

  command "Load schema.rb to DB" do |cmd|
    cmd.invoke {|context|  Ruble::Terminal.open("rake db:schema:load", context.project.to_dir.path) }
  end

  # FIXME: generate quick migration?

  command "Load Fixtures to Test DB" do |cmd|
    cmd.invoke {|context|  Ruble::Terminal.open("rake db:fixtures:load RAILS_ENV=test", context.project.to_dir.path) }
  end

  command "Load Fixtures to Development DB" do |cmd|
    cmd.invoke {|context|  Ruble::Terminal.open("rake db:fixtures:load", context.project.to_dir.path) }
  end

  command "Migrate to Previous Version" do |cmd|
    cmd.invoke do |context|
      # FIXME: need to do this in RUBY directly
      current_schema_version = "0" #`grep 'Schema\.define' "$TM_PROJECT_DIRECTORY/db/schema.rb" | ruby -e 'print $stdin.read.scan(/\d+/).first'`
      Ruble::Terminal.open("rake db:migrate:down VERSION=#{current_schema_version}", context.project.to_dir.path)
    end
  end

  # Migrate to version is in textmate, but sucks. we can do better with a gui...
  command "Migrate to Current" do |cmd|
    cmd.invoke {|context|  Ruble::Terminal.open("rake db:migrate", context.project.to_dir.path) }
  end

  command "Redo Last Migration" do |cmd|
    cmd.invoke {|context|  Ruble::Terminal.open("rake db:migrate:redo", context.project.to_dir.path) }
  end
end

# FIXME textmate macro has scopeType=local. what is our equivalent?
with_defaults :scope => "source.ruby.rails",
#:scope => "meta.rails.migration - meta.rails.migration.create_table - meta.rails.migration.change_table",
              :input => :selection,
              :output => :insert_as_snippet do |bundle|
  
  command "Add / Remove Column" do |cmd|
    # cmd.extend IntelligentMigration
    cmd.trigger = "mcol"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :add_remove_column) }
  end

  command "Add / Remove Index" do |cmd|
    cmd.trigger = "mind"  
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :add_remove_index) }
  end

  command "Add / Remove Named Index" do |cmd|
    cmd.trigger = "mind"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :add_remove_named_index) }
  end

  command "Add / Remove Several Columns (marcc)" do |cmd|
    cmd.trigger = "marcc"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :add_remove_column_continue) }
  end

  command "Add / Remove Several Columns" do |cmd|
    cmd.trigger = "mcol"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :add_remove_column_continue) }
  end

  command "Add / Remove Timestamps" do |cmd|
    cmd.trigger = "mcol"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :add_remove_timestamps) }
  end

  command "Add / Remove Unique Index" do |cmd|
    cmd.trigger = "mind"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :add_remove_unique_index) }
  end

  command "Change / Change Table" do |cmd|
    cmd.trigger = "mtab"    
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :change_change_table) }
  end

  command "Change Column Default" do |cmd|
    cmd.trigger = "mcol"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :change_column_default) }
  end

  command "Change Column" do |cmd|
    cmd.trigger = "mcol"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :change_column) }
  end

  command "Create / Drop Table" do |cmd|
    cmd.trigger = "mtab"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :create_drop_table) }
  end

  command "Remove / Add Timestamps" do |cmd|
    cmd.trigger = "mcol"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :remove_add_timestamps) }
  end

  command "Rename Several Columns (mncc)" do |cmd|
    cmd.trigger = "mncc"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :rename_column_continue) }
  end

  command "Rename Several Columns" do |cmd|
    cmd.trigger = "mcol"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :rename_column_continue) }
  end

  command "Rename Column" do |cmd|
    cmd.trigger = "mcol"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :rename_column) }
  end

  command "Rename Table" do |cmd|
    cmd.trigger = "mtab"
    cmd.invoke {|context| require 'rails/intelligent_migration'; IntelligentMigration.process_migration(context, :rename_table) }
  end

end
