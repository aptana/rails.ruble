require 'ruble'

bundle do |bundle|
  bundle.author = "Many"
  bundle.copyright = <<END
© Copyright 2010 Aptana Inc. Distributed under the MIT license.

Portions © Copyright 2006 syncPEOPLE, LLC, distributed under the terms of the MIT License.
END

  bundle.display_name = "Ruby on Rails"
  bundle.description = <<END
Rails bundle for RadRails, based heavily on Dr. Nic's tmbundle
(http://github.com/drnic/ruby-on-rails-tmbundle), which in turn was
based heavily on the original SyncPeople bundle.
END

  bundle.repository = "git://github.com/aptana/rails.ruble.git"
  bundle.file_types['source.ruby.rails'] = "*.rb"

  # most commands install into a dedicated rails menu
  # See also the alternative, HAML-style syntax in menu.rrmenu
  bundle.menu "Rails" do |rails_menu|
    # this menu should be shown when any of the following scopes is active:
    rails_menu.scope = [ "source.ruby", "project.rails" ]
    
    rails_menu.command "Preview"
    rails_menu.separator
    
    rails_menu.menu "Go To" do |goto_menu|
      # command/snippet names must be unique within bundle and are case insensitive
      goto_menu.command "Go to Alternate File"
      goto_menu.command "Go to File on Current Line"

      goto_menu.separator
      
      goto_menu.command "Go to Model"
      goto_menu.command "Go to View"
      goto_menu.command "Go to Controller"
      goto_menu.command "Go to Functional Test"
      goto_menu.command "Go to Helper"
      goto_menu.command "Go to Javascript"
      goto_menu.command "Go to Stylesheet"
      goto_menu.command "Go to Unit Test"
      goto_menu.command "Go to Fixture"
    end
    rails_menu.menu "Run Tests" do |run_tests_menu|
      run_tests_menu.command "Test All"
      run_tests_menu.command "Test Functionals"
      run_tests_menu.command "Test Integration"
      run_tests_menu.command "Test Plugins"
      run_tests_menu.command "Test Recent"
      run_tests_menu.command "Test Uncommitted"
      run_tests_menu.command "Test Units"
    end
    
    rails_menu.separator
    
    rails_menu.command "Call Generate Script"
    rails_menu.command "Install Plugin"
    rails_menu.menu "Database" do |db_menu|
      db_menu.command "Migrate to Current"
      db_menu.command "Migrate to Version..."
      db_menu.command "Migrate to Previous Version"
      db_menu.command "Redo Last Migration"

      db_menu.separator

      db_menu.command "Load Fixtures (Development DB)"
      db_menu.command "Load Fixtures (Test DB)"

      db_menu.separator

      db_menu.command "Load schema.rb to DB"
      db_menu.command "Dump DB to schema.rb"
      db_menu.command "Clone Development DB to Test DB"
    end

    rails_menu.separator

    rails_menu.command "params[...]"
    rails_menu.command "session[...]"
    rails_menu.menu "Logger" do |logger_menu|
      logger_menu.command "logger.debug"
      logger_menu.command "logger.info"
      logger_menu.command "logger.warn"
      logger_menu.command "logger.error"
      logger_menu.command "logger.fatal"
      logger_menu.command "RAILS_DEFAULT_LOGGER.debug"
    end

    rails_menu.separator

    rails_menu.menu "Models" do |models_menu|
      models_menu.command "Show DB Schema for Current Class"

      models_menu.separator

      models_menu.command "alias_attribute"

      models_menu.separator

      models_menu.menu "Callbacks" do |callbacks_menu|
        callbacks_menu.command "before_validation"
        callbacks_menu.command "before_validation_on_create"
        callbacks_menu.command "before_validation_on_update"
        callbacks_menu.command "after_validation"
        callbacks_menu.command "after_validation_on_create"
        callbacks_menu.command "after_validation_on_update"
        callbacks_menu.command "before_save"
        callbacks_menu.command "after_save"
        callbacks_menu.command "before_create"
        callbacks_menu.command "after_create"
        callbacks_menu.command "before_update"
        callbacks_menu.command "after_update"
        callbacks_menu.command "before_destroy"
        callbacks_menu.command "after_destroy"
      end
      models_menu.menu "Associations" do |associations_menu|
        associations_menu.command "belongs_to"
        associations_menu.command "has_and_belongs_to_many"
        associations_menu.command "has_one"
        associations_menu.command "has_many"
        associations_menu.command "has_many :dependent => :destroy"
        associations_menu.command "has_many (through)"
        associations_menu.separator
        associations_menu.command "accepts_nested_attributes_for"
      end
      models_menu.menu "Scopes" do |scopes_menu|
        scopes_menu.command "find(id)"
        scopes_menu.command "find(:all)"
        scopes_menu.command "find(:first)"
        scopes_menu.command "find(:last)"
        scopes_menu.command "find_in_batches"
        scopes_menu.separator
        scopes_menu.command "scoped_by"
      end
      models_menu.menu "Finders" do |finders_menu|
        finders_menu.command "find(id)"
        finders_menu.command "find(:all)"
        finders_menu.command "find(:first)"
        finders_menu.command "find(:last)"
        finders_menu.command "find_in_batches"
        finders_menu.separator
        finders_menu.command "scoped_by"
      end
      models_menu.menu "Validations" do |validations_menu|
        validations_menu.command "validates_acceptance_of"
        validations_menu.command "validates_acceptance_of if"
        validations_menu.command "validates_associated"
        validations_menu.command "validates_associated if"
        validations_menu.command "validates_confirmation_of"
        validations_menu.command "validates_confirmation_of if"
        validations_menu.command "validates_exclusion_of"
        validations_menu.command "validates_exclusion_of if"
        validations_menu.command "validates_inclusion_of"
        validations_menu.command "validates_inclusion_of if"
        validations_menu.command "validates_format_of"
        validations_menu.command "validates_format_of if"
        validations_menu.command "validates_length_of"
        validations_menu.command "validates_length_of if"
        validations_menu.command "validates_numericality_of"
        validations_menu.command "validates_numericality_of if"
        validations_menu.command "validates_presence_of"
        validations_menu.command "validates_presence_of if"
        validations_menu.command "validates_uniqueness_of"
        validations_menu.command "validates_uniqueness_of if"
      end
    end
    rails_menu.menu "Controllers" do |controllers_menu|
      controllers_menu.command "Create controller class"
      controllers_menu.command "Create resources controller class"
      controllers_menu.command "layout"
      controllers_menu.command "before_filter"
      controllers_menu.command "flash[...]"
      controllers_menu.menu "respond_to" do |respond_to_menu|
        respond_to_menu.command "respond_to (html)"
        respond_to_menu.command "respond_to"
        respond_to_menu.command "wants.format"
      end
      controllers_menu.menu "redirect_to" do |redirect_to_menu|
        redirect_to_menu.command "redirect_to (path)"
        redirect_to_menu.command "redirect_to (path plural)"
        redirect_to_menu.command "redirect_to (nested path)"
        redirect_to_menu.command "redirect_to (nested path plural)"
        redirect_to_menu.command "redirect_to (action)"
        redirect_to_menu.command "redirect_to (action, id)"
        redirect_to_menu.command "redirect_to (controller)"
        redirect_to_menu.command "redirect_to (controller, action)"
        redirect_to_menu.command "redirect_to (controller, action, id)"
        redirect_to_menu.command "redirect_to :back"
      end
      controllers_menu.menu "render" do |render_menu|
        render_menu.command "render (action)"
        render_menu.command "render (action, layout)"
        render_menu.command "render (file)"
        render_menu.command "render (file, use_full_path)"
        render_menu.command "render (inline)"
        render_menu.command "render (inline, locals)"
        render_menu.command "render (inline, type)"
        render_menu.command "render (layout)"
        render_menu.command "render (nothing)"
        render_menu.command "render (nothing, status)"
        render_menu.command "render (partial)"
        render_menu.command "render (partial, collection)"
        render_menu.command "render (partial, locals)"
        render_menu.command "render (partial, object)"
        render_menu.command "render (partial, status)"
        render_menu.command "render (text)"
        render_menu.command "render (text, layout)"
        render_menu.command "render (text, layout => true)"
        render_menu.command "render (text, status)"
        render_menu.command "render (update)"
      end
      controllers_menu.menu "REST methods" do |rest_methods_menu|
        rest_methods_menu.command "def create - resource"
      end

      controllers_menu.separator

      controllers_menu.command "verify - render"
      controllers_menu.command "verify - redirect"
    end
    rails_menu.menu "View Templates" do |view_templates_menu|
      view_templates_menu.command "Create Partial from Selection"
      
      view_templates_menu.separator
      
      view_templates_menu.command "form_for"
      view_templates_menu.command "form_for with errors"
      view_templates_menu.menu "form_for f.drop-down list" do |for_for_list_menu|
        for_for_list_menu.command "f.label (ffl)"
        for_for_list_menu.command "f.text_field (fftf)"
        for_for_list_menu.command "f.text_area (ffta)"
        for_for_list_menu.command "f.check_box (ffcb)"
        for_for_list_menu.command "f.radio_button (ffrb)"
        for_for_list_menu.command "f.password_field (ffpf)"
        for_for_list_menu.command "f.hidden_field (ffhf)"
        for_for_list_menu.command "f.file_field (ffff)"
        for_for_list_menu.command "f.submit (ffs)"
        for_for_list_menu.command "f.fields_for (nff)"
      end
      view_templates_menu.menu "form_for helpers" do |form_for_helpers_menu|
        form_for_helpers_menu.command "form_for label"
        form_for_helpers_menu.command "form_for text_field"
        form_for_helpers_menu.command "form_for text_area"
        form_for_helpers_menu.command "form_for check_box"
        form_for_helpers_menu.command "form_for radio_button"
        form_for_helpers_menu.command "form_for password_field"
        form_for_helpers_menu.command "form_for hidden_field"
        form_for_helpers_menu.command "form_for file_field"
        form_for_helpers_menu.command "form_for submit"
        form_for_helpers_menu.command "form_for fields_for"
      end
      view_templates_menu.command "fields_for"
      
      view_templates_menu.separator
      
      view_templates_menu.command "form_tag"
      view_templates_menu.command "submit_tag"
      view_templates_menu.command "image_submit_tag"
      view_templates_menu.menu "link_to" do |link_to_menu|
        link_to_menu.command "link_to (path)"
        link_to_menu.command "link_to (path plural)"
        link_to_menu.command "link_to (nested path)"
        link_to_menu.command "link_to (nested path plural)"
        link_to_menu.command "link_to (action)"
        link_to_menu.command "link_to (action, id)"
        link_to_menu.command "link_to (controller)"
        link_to_menu.command "link_to (controller, action)"
        link_to_menu.command "link_to (controller, action, id)"
        link_to_menu.command "link_to model"
      end
      view_templates_menu.command "end (ERB)"
      
      view_templates_menu.separator
      
      view_templates_menu.command "map(&:sym_proc)"
      
      view_templates_menu.separator
      
      view_templates_menu.command "content_for"
      view_templates_menu.command "for loop in rhtml"
    end
    rails_menu.menu "Layouts" do |layouts_menu|
      layouts_menu.command "javascript_include_tag"
      layouts_menu.command "stylesheet_link_tag"
    end
    rails_menu.menu "RJS" do |rjs_menu|
      rjs_menu.command "page.replace (id, partial)"
      rjs_menu.command "page.hide (*ids)"
      rjs_menu.command "page.replace_html (id, partial)"
      rjs_menu.command "page.insert_html (position, id, partial)"
      rjs_menu.command "page.visual_effect (effect, id)"
      rjs_menu.command "page.show (*ids)"
      rjs_menu.command "page.toggle (*ids)"
    end
    rails_menu.menu "Migrations" do |migrations_menu|
      migrations_menu.menu "Columns" do |columns_menu|
        columns_menu.command "Add / Remove Column"
        columns_menu.command "Add / Remove Several Columns"
        columns_menu.command "Add / Remove Several Columns (marcc)"
        columns_menu.command "Add / Remove Timestamps"
        columns_menu.command "Change Column"
        columns_menu.command "Change Column Default"
        columns_menu.command "Rename Column"
        columns_menu.command "Rename Several Columns"
        columns_menu.command "Rename Several Columns (mncc)"
        columns_menu.command "Remove / Add Column"
        columns_menu.command "Remove / Add Timestamps"
      end
      migrations_menu.menu "Tables" do |tables_menu|
        tables_menu.command "Create / Drop Table"
        tables_menu.command "Rename Table"
        tables_menu.command "Drop / Create Table"
        tables_menu.command "Change Table"

        tables_menu.menu "Create columns t. drop-down list" do |create_columns_list_menu|
          create_columns_list_menu.command "t.string (tcs)"
          create_columns_list_menu.command "t.text (tct)"
          create_columns_list_menu.command "t.integer (tci)"
          create_columns_list_menu.command "t.float (tcf)"
          create_columns_list_menu.command "t.decimal (tcd)"
          create_columns_list_menu.command "t.datetime (tcdt)"
          create_columns_list_menu.command "t.timestamp (tcts)"
          create_columns_list_menu.command "t.time (tcti)"
          create_columns_list_menu.command "t.date (tcda)"
          create_columns_list_menu.command "t.boolean (tcb)"
          create_columns_list_menu.command "t.binary (tcbi)"
          create_columns_list_menu.command "t.timestamps (tctss)"
          create_columns_list_menu.command "t.lock_version (tcl)"
          create_columns_list_menu.command "t.references (tcr)"
        end
        tables_menu.menu "Create columns helpers" do |create_columns_helpers_menu|
          create_columns_helpers_menu.command "Table column string"
          create_columns_helpers_menu.command "Table column text"
          create_columns_helpers_menu.command "Table column integer"
          create_columns_helpers_menu.command "Table column float"
          create_columns_helpers_menu.command "Table column decimal"
          create_columns_helpers_menu.command "Table column datetime"
          create_columns_helpers_menu.command "Table column timestamp"
          create_columns_helpers_menu.command "Table column time"
          create_columns_helpers_menu.command "Table column date"
          create_columns_helpers_menu.command "Table column boolean"
          create_columns_helpers_menu.command "Table column binary"
          create_columns_helpers_menu.command "Table column timestamps"
          create_columns_helpers_menu.command "Table column lock_version"
          create_columns_helpers_menu.command "Table column(s) references"
        end
        tables_menu.command "Create Column in Table"
        tables_menu.command "Create Several Columns in Table"
        tables_menu.menu "Change columns t. drop-down list" do |change_columns_list_menu|
          change_columns_list_menu.command "t.change (tch)"
          change_columns_list_menu.command "t.rename (tre)"
        end
        tables_menu.menu "Change columns t. helpers" do |change_columns_helper_menu|
          change_columns_helper_menu.command "Table column(s) change"
          change_columns_helper_menu.command "Table column(s) rename"
        end
      end
      migrations_menu.menu "Indices" do |indices_menu|
        indices_menu.command "Add / Remove Index"
        indices_menu.command "Add / Remove Named Index"
        indices_menu.command "Add / Remove Unique Index"
      end
    end
    rails_menu.menu "Environment" do |environment_menu|
      environment_menu.command "config.gem"
    end
    rails_menu.menu "Routes" do |routes_menu|
      routes_menu.command "map.named_route"
      routes_menu.command "map.resources"
      routes_menu.command "map.resource"
      routes_menu.command "map.with_options"
      routes_menu.command "map.catch_all"
    end
    rails_menu.menu "ActiveSupport" do |active_support_menu|
      active_support_menu.command "cattr_accessor"
      active_support_menu.command "mattr_accessor"
      active_support_menu.command "returning do |variable| ... end"
    end

    rails_menu.separator

    rails_menu.menu "Fixtures" do |fixtures_menu|
      fixtures_menu.command "$LABEL"
      fixtures_menu.command "<%= Fixtures.identify(:symbol) %>"
      fixtures_menu.separator
      fixtures_menu.command "Autocomplete Foreign Key Fixture Reference"
      fixtures_menu.command "Autocomplete Foreign Key Fixture Reference (habtm)"
    end
    rails_menu.command "test do...end"
    rails_menu.menu "Unit Tests" do |unit_tests_menu|
      unit_tests_menu.command "assert_difference"
      unit_tests_menu.command "assert_no_difference"
    end
    rails_menu.menu "Functional Tests" do |functional_tests_menu|
      functional_tests_menu.command "Create functional test class"
      functional_tests_menu.command "def test_should_get_action"
      functional_tests_menu.command "def test_should_post_action"
      functional_tests_menu.separator
      functional_tests_menu.command "assert_response"
      functional_tests_menu.command "assert_redirected_to"
      functional_tests_menu.command "assert_redirected_to (path)"
      functional_tests_menu.command "assert_redirected_to (path plural)"
      functional_tests_menu.command "assert_redirected_to (nested path)"
      functional_tests_menu.command "assert_redirected_to (nested path plural)"
      functional_tests_menu.separator
      functional_tests_menu.command "assert_select"
      functional_tests_menu.separator
      functional_tests_menu.command "assert_rjs"
      functional_tests_menu.separator
      functional_tests_menu.command "assert(var= assigns(:var))"
    end
    rails_menu.menu "Ajax Tests" do |ajax_tests_menu|
      ajax_tests_menu.command "xhr post"
      ajax_tests_menu.command "xhr get"
      ajax_tests_menu.command "xhr delete"
      ajax_tests_menu.command "xhr put"
    end

    rails_menu.separator

    rails_menu.command "Documentation for Word"
    rails_menu.command "find_each"
  end
end

# Extend Ruble::Editor to add special ENV vars
module Ruble
  class Editor
    unless method_defined?(:to_env_pre_rails_bundle)
      alias :to_env_pre_rails_bundle :to_env
      def to_env
        env_hash = to_env_pre_rails_bundle
        scopes = current_scope.split(' ')
        if scopes.include? "text.html.ruby"
          env_hash['TM_RAILS_TEMPLATE_START_RUBY_EXPR'] = "<%= "
          env_hash['TM_RAILS_TEMPLATE_END_RUBY_EXPR'] = " %>"
          env_hash['TM_RAILS_TEMPLATE_START_RUBY_INLINE'] = "<% "
          env_hash['TM_RAILS_TEMPLATE_END_RUBY_INLINE'] = " -%>"
          env_hash['TM_RAILS_TEMPLATE_END_RUBY_BLOCK'] = "<% end -%>"
        elsif scopes.include? "text.haml"
          env_hash['TM_RAILS_TEMPLATE_START_RUBY_EXPR'] = "= "
          env_hash['TM_RAILS_TEMPLATE_END_RUBY_EXPR'] = ""
          env_hash['TM_RAILS_TEMPLATE_START_RUBY_INLINE'] = "- "
          env_hash['TM_RAILS_TEMPLATE_END_RUBY_INLINE'] = ""
          env_hash['TM_RAILS_TEMPLATE_END_RUBY_BLOCK'] = ""
        end
        env_hash
      end
    end
  end
end

module Ruble
  class Project
    # Add a method allowing commands to get root URL of server for project...
    def root_url
      port = 3000
      host = "localhost"
      # Only scan processes on non-windows platforms
      if !Ruble.platforms.include? :windows
        # Rails 2.x
        # FIXME This doesn't have the project location in the args!
        out = IO.popen('ps wwax -o args | grep "script/server"', 'r') {|io| io.read } || ''
        out.each_line do |line|
          words = line.split(' ')
          next if words.first == 'grep'
          # Ok we need to search the words starting at index 2, look for --port or -p
          words = words[2..-1]
          next if words.nil?
          words.each_with_index do |word, i|
            puts word
            port = words[i + 1] if word == "-p" || word == "--port"
            # TODO What if they used --switch=value format?
            host = words[i + 1] if word == "-b" || word == "--binding"
          end
        end
        # Rails 3.x
        out = IO.popen('ps wwax -o args | grep "rails server"', 'r') {|io| io.read } || ''
        out.each_line do |line|
          words = line.split(' ')
          next if words.first == 'grep'
          next unless words[1].start_with? to_dir.path # looks like it's this project
          # Ok we need to search the words starting at index 2, look for --port or -p
          words = words[2..-1]
          next if words.nil?
          words.each_with_index do |word, i|
            puts word
            port = words[i + 1] if word == "-p" || word == "--port"
            # TODO What if they used --switch=value format?
            host = words[i + 1] if word == "-b" || word == "--binding"
          end
        end
      end
      # TODO if host is 0.0.0.0 or 127.0.0.1, change to localhost or something?
      "http://#{host}:#{port}/"
    end
  end
end