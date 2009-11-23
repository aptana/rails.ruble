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

# FIX: textmate macro has scopeType=local. what is our equivalent?
with_defaults { :scope => "meta.rails.migration - meta.rails.migration.create_table - meta.rails.migration.change_table",
                :input = :selection,
                :output = :insert_as_snippet,
                :output => :show_as_html }
do |bundle|
  command "Add / Remove Column" do |cmd|
    # since a Command is a class definition, we can extend it using a module
    extend IntelligentMigration

    cmd.trigger = "mcol"
    
    cmd.invoke do |context|
      process_migration(context, :add_remove_column)
    end
  end

  command "Add / Remove Index" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mind"
    
    cmd.invoke do |context|
      process_migration(context, :add_remove_index)
    end
  end

  command "Add / Remove Named Index" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mind"
    
    cmd.invoke do |context|
      process_migration(context, :add_remove_named_index)
    end
  end

  command "Add / Remove Several Columns (marcc)" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "marcc"
    
    cmd.invoke do |context|
      process_migration(context, :add_remove_column_continue)
    end
  end

  command "Add / Remove Several Columns" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mcol"
    
    cmd.invoke do |context|
      process_migration(context, :add_remove_column_continue)
    end
  end

  command "Add / Remove Timestamps" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mcol"
    
    cmd.invoke do |context|
      process_migration(context, :add_remove_timestamps)
    end
  end

  command "Add / Remove Unique Index" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mind"
    
    cmd.invoke do |context|
      process_migration(context, :add_remove_unique_index)
    end
  end

  command "Change / Change Table" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mtab"
    
    cmd.invoke do |context|
      process_migration(context, :change_change_table)
    end
  end

  command "Change Column Default" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mcol"
    
    cmd.invoke do |context|
      process_migration(context, :change_column_default)
    end
  end

  command "Change Column" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mcol"
    
    cmd.invoke do |context|
      process_migration(context, :change_column)
    end
  end

  command "Create / Drop Table" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mtab"
    
    cmd.invoke do |context|
      process_migration(context, :create_drop_table)
    end
  end

  command "Remove / Add Timestamps" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mcol"
    
    cmd.invoke do |context|
      process_migration(context, :remove_add_timestamps)
    end
  end

  command "Rename / Rename Several Columns (mncc)" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mncc"
    
    cmd.invoke do |context|
      process_migration(context, :rename_column_continue)
    end
  end

  command "Rename / Rename Several Columns" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mcol"
    
    cmd.invoke do |context|
      process_migration(context, :rename_column_continue)
    end
  end

  command "Rename / Rename Column" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mcol"
    
    cmd.invoke do |context|
      process_migration(context, :rename_column)
    end
  end

  command "Rename / Rename Table" do |cmd|
    extend IntelligentMigration

    cmd.trigger = "mtab"
    
    cmd.invoke do |context|
      process_migration(context, :rename_table)
    end
  end

end

# FIX: missing from textmate's plugin "Drop / Create Table" & "Remove / Add Column" macros
