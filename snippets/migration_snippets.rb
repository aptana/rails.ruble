require 'radrails'

with_defaults { :scope => "meta.rails.migration.create_table, meta.rails.migration.change_table" }
do |bundle|

  snippet "Table column binary" do |snippet|
    snippet.trigger = "tcbi"
    snippet.expansion = "t.binary :${1:title}${2:, :limit =&gt; ${3:2}.megabytes}\n$0"
  end

  snippet "Table column boolean" do |snippet|
    snippet.trigger = "tcb"
    snippet.expansion = "t.boolean :${1:title}\n$0"
  end

  snippet "Table column date" do |snippet|
    snippet.trigger = "tcda"
    snippet.expansion = "t.date :${1:title}\n$0"
  end

  snippet "Table column datetime" do |snippet|
    snippet.trigger = "tcdt"
    snippet.expansion = "t.datetime :${1:title}\n$0"
  end

  snippet "Table column decimal" do |snippet|
    snippet.trigger = "tcd"
    snippet.expansion = "t.decimal :${1:title}${2:${3:, :precision =&gt; ${4:10}}${5:, :scale =&gt; ${6:2}}}\n$0"
  end

  snippet "Table column float" do |snippet|
    snippet.trigger = "tcf"
    snippet.expansion = "t.float :${1:title}\n$0"
  end

  snippet "Table column integer" do |snippet|
    snippet.trigger = "tci"
    snippet.expansion = "t.integer :${1:title}\n$0"
  end

  snippet "Table column lock_version" do |snippet|
    snippet.trigger = "tcl"
    snippet.expansion = "t.binary integer :lock_version, :null =&gt; false, :default =&gt; 0\n$0"
  end

  snippet "Table column(s) references" do |snippet|
    snippet.trigger = "tcr"
    snippet.expansion = "t.references :${1:taggable}${2:, :polymorphic =&gt; ${3:{ :default =&gt; '${4:Photo}' \}}}\n$0"
  end

  snippet "Table column string" do |snippet|
    snippet.trigger = "tcs"
    snippet.expansion = "t.string :${1:title}\n$0"
  end

  snippet "Table column text" do |snippet|
    snippet.trigger = "tct"
    snippet.expansion = "t.text :${1:title}\n$0"
  end

  snippet "Table column time" do |snippet|
    snippet.trigger = "tcti"
    snippet.expansion = "t.time :${1:title}\n$0"
  end

  snippet "Table column timestamp" do |snippet|
    snippet.trigger = "tcts"
    snippet.expansion = "t.timestamp :${1:title}\n$0"
  end

  snippet "Table column timestamps" do |snippet|
    snippet.trigger = "tctss"
    snippet.expansion = "t.timestamps\n$0"
  end

  snippet "t.binary (tcbi)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.binary :${1:title}${2:, :limit =&gt; ${3:2}.megabytes}\nt.$0"
  end

  snippet "t.boolean (tcb)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.boolean :${1:title}\nt.$0"
  end

  snippet "t.change (tch)" do |snippet|
    snippet.scope = "meta.rails.migration.change_table"
    snippet.trigger = "t."
    snippet.expansion = "t.change :${1:name}${2:, :${3:string}${4:, :${5:limit} =&gt; ${6:80}}}\nt.$0"
  end

  snippet "t.date (tcda)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.date :${1:title}\nt.$0"
  end

  snippet "t.datetime (tcdt)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.datetime :${1:title}\nt.$0"
  end

  snippet "t.decimal (tcd)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.decimal :${1:title}${2:${3:, :precision =&gt; ${4:10}}${5:, :scale =&gt; ${6:2}}}\nt.$0"
  end

  snippet "t.float (tcf)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.float :${1:title}\nt.$0"
  end

  snippet "t.integer (tci)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.integer :${1:title}\nt.$0"
  end

  snippet "t.lock_version (tcl)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.integer :lock_version, :null =&gt; false, :default =&gt; 0\nt.$0"
  end

  snippet "t.references (tcr)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.references :${1:taggable}${2:, :polymorphic =&gt; ${3:{ :default =&gt; '${4:Photo}' \}}}\nt.$0"
  end

  snippet "t.rename (tre)" do |snippet|
    snippet.scope = "meta.rails.migration.change_table"
    snippet.trigger = "t."
    snippet.expansion = "t.rename :${1:old_column_name}, :${2:new_column_name}\nt.$0"
  end

  snippet "t.string (tcs)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.string :${1:title}\nt.$0"
  end

  snippet "t.text (tct)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.text :${1:title}\nt.$0"
  end

  snippet "t.time (tcti)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.time :${1:title}\nt.$0"
  end

  snippet "t.timestamp (tcts)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.timestamp :${1:title}\nt.$0"
  end

  snippet "t.timestamps (tctss)" do |snippet|
    snippet.trigger = "t."
    snippet.expansion = "t.timestamps\nt.$0"
  end
end
