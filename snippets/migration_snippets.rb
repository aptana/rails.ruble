require 'radrails'

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

snippet "Create Column in Table" do |snippet|
  snippet.scope = "meta.rails.migration.create_table"
  snippet.trigger = "mcol"
  snippet.expansion = "t.column ${1:title}, :${2:string}\n\t$0"
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

with_defaults { :scope => "meta.rails.migration.create_table, meta.rails.migration.change_table" }
do |bundle|

  snippet "Table column binary" do |snippet|
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
