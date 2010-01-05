require 'radrails'

require 'rails/intelligent_migration'

# FIXME: key_binding should be "M1+|"
with_defaults :scope => "source.ruby.rails, source.yaml",
              :key_binding => "M1+SHIFT+\\",
              :output => :show_as_html do |bundle|
  command "Clone Development DB to Test DB" do |cmd|
    cmd.invoke = "rake db:test:clone"
  end

  command "Dump DB to schema.rb" do |cmd|
    cmd.invoke = "rake db:schema:dump"
  end

  command "Load schema.rb to DB" do |cmd|
    cmd.invoke = "rake db:schema:load"
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
with_defaults :scope => "meta.rails.migration - meta.rails.migration.create_table - meta.rails.migration.change_table",
              :input => :selection,
              :output => :insert_as_snippet do |bundle|
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

snippet "Create Column in Table" do |snippet|
  snippet.scope = "meta.rails.migration.create_table"
  snippet.trigger = "mcol"
  snippet.expansion = "t.column ${1:title}, :${2:string}\n\t$0"
end

snippet "Drop / Create Table" do |snippet|
  snippet.scope = "meta.rails.migration - meta.rails.migration.create_table - meta.rails.migration.change_table"
  snippet.trigger = "mtab"
  snippet.expansion = "drop_table :${1:table}${2: [press tab twice to generate create_table]}"
end

snippet "Remove / Add Column" do |snippet|
  snippet.scope = "meta.rails.migration - meta.rails.migration.create_table - meta.rails.migration.change_table"
  snippet.trigger = "mcol"
  snippet.expansion = "remove_column :${1:table}, :${2:column}${3: [press tab twice to generate add_column]}"
end

snippet "Table column(s) change" do |snippet|
  snippet.scope = "meta.rails.migration.change_table"
  snippet.trigger = "tch"
  snippet.expansion = "t.change :${1:name}${2:, :${3:string}${4:, :${5:limit} => ${6:80}}}\n$0"
end

snippet "Table column(s) rename" do |snippet|
  snippet.scope = "meta.rails.migration.change_table"
  snippet.trigger = "tre"
  snippet.expansion = "t.rename :${1:old_column_name}, :${2:new_column_name}\n$0"
end

with_defaults :scope => "meta.rails.migration.create_table, meta.rails.migration.change_table" do |bundle|

  snippet "Table column" do |snippet|
    snippet.trigger = "mcol"
    snippet.expansion = "t.column ${1:title}, :${2:string}\n\t$0"
  end

  snippet "Table column binary" do |snippet|
    snippet.trigger = [ "t.", "tcbi" ]
    snippet.expansion = "t.binary :${1:title}${2:, :limit => ${3:2}.megabytes}\n$0"
  end

  snippet "Table column boolean" do |snippet|
    snippet.trigger = [ "t.", "tcb" ]
    snippet.expansion = "t.boolean :${1:title}\n$0"
  end

  snippet "Table column date" do |snippet|
    snippet.trigger = [ "t.", "tcda" ]
    snippet.expansion = "t.date :${1:title}\n$0"
  end

  snippet "Table column datetime" do |snippet|
    snippet.trigger = [ "t.", "tcdt" ]
    snippet.expansion = "t.datetime :${1:title}\n$0"
  end

  snippet "Table column decimal" do |snippet|
    snippet.trigger = [ "t.", "tcd" ]
    snippet.expansion = "t.decimal :${1:title}${2:${3:, :precision => ${4:10}}${5:, :scale => ${6:2}}}\n$0"
  end

  snippet "Table column float" do |snippet|
    snippet.trigger = [ "t.", "tcf" ]
    snippet.expansion = "t.float :${1:title}\n$0"
  end

  snippet "Table column integer" do |snippet|
    snippet.trigger = [ "t.", "tci" ]
    snippet.expansion = "t.integer :${1:title}\n$0"
  end

  snippet "Table column lock_version" do |snippet|
    snippet.trigger = [ "t.", "tcl" ]
    snippet.expansion = "t.binary integer :lock_version, :null => false, :default => 0\n$0"
  end

  snippet "Table column(s) references" do |snippet|
    snippet.trigger = [ "t.", "tcr" ]
    snippet.expansion = "t.references :${1:taggable}${2:, :polymorphic => ${3:{ :default => '${4:Photo}' \}}}\n$0"
  end

  snippet "Table column string" do |snippet|
    snippet.trigger = [ "t.", "tcs" ]
    snippet.expansion = "t.string :${1:title}\n$0"
  end

  snippet "Table column text" do |snippet|
    snippet.trigger = [ "t.", "tct" ]
    snippet.expansion = "t.text :${1:title}\n$0"
  end

  snippet "Table column time" do |snippet|
    snippet.trigger = [ "t.", "tcti" ]
    snippet.expansion = "t.time :${1:title}\n$0"
  end

  snippet "Table column timestamp" do |snippet|
    snippet.trigger = [ "t.", "tcts" ]
    snippet.expansion = "t.timestamp :${1:title}\n$0"
  end

  snippet "Table column timestamps" do |snippet|
    snippet.trigger = [ "t.", "tctss" ]
    snippet.expansion = "t.timestamps\n$0"
  end

  snippet "t.change (tch)" do |snippet|
    snippet.scope = "meta.rails.migration.change_table"
    snippet.trigger = "t."
    snippet.expansion = "t.change :${1:name}${2:, :${3:string}${4:, :${5:limit} => ${6:80}}}\nt.$0"
  end

  snippet "t.rename (tre)" do |snippet|
    snippet.scope = "meta.rails.migration.change_table"
    snippet.trigger = "t."
    snippet.expansion = "t.rename :${1:old_column_name}, :${2:new_column_name}\nt.$0"
  end

end
