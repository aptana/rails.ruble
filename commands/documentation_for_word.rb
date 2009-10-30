require 'radrails'

# its ruby, so this just addscommands/snippets in bundle (or replaces those with same name)
# many ruby files could add to a single bundle
RadRails.bundle "MyBundle" do |rr|
  ####
  # Example command "Documentation for Word" from Rails bundle:
  #  <dict>
  #    <key>beforeRunningCommand</key>
  #    <string>nop</string>
  #    <key>command</key>
  #    <string>#!/usr/bin/env ruby
  #            url = "http://apidock.com/rails/search/quick?query=" + ENV['TM_CURRENT_WORD']
  #            puts "&lt;meta http-equiv='Refresh' content='0;URL=#{url}'&gt;"
  #    </string>
  #    <key>fallbackInput</key>
  #    <string>word</string>
  #    <key>input</key>
  #    <string>selection</string>
  #    <key>keyEquivalent</key>
  #    <string>^h</string>
  #    <key>name</key>
  #    <string>Documentation for Word</string>
  #    <key>output</key>
  #    <string>showAsHTML</string>
  #    <key>scope</key>
  #    <string>source.ruby.rails, text.html.ruby, text.haml</string>
  #    <key>uuid</key>
  #    <string>32F30207-D827-46D9-889A-451C35269D52</string>
  #  </dict>
  #  </plist>
  rr.command "Documentation for Word" do |cmd|
    cmd.key_binding[:mac] =  [ :command, "h" ]
    cmd.key_binding =        [ :control, "h" ]
    # if selection isn't empty, use it, otherwise use the word containing the current selection
    cmd.input = [ :selection, :word ]
    cmd.output = :show_as_html
    cmd.scope = [ :source_ruby_rails, :text_html_ruby, :text_haml ]
    cmd.invoke do |context|
      # stdout in this block is directed to cmd.output (available here read-only as context.output)
      # environment variables are available by using context as a hash, a la TextMate
      
      # context.input will figure out what to pass in correctly based on command settings
      url = "http://apidock.com/rails/search/quick?query=" + context.input

      # this is a hack - relies on embedded html view fetching page for you.
      puts "&lt;meta http-equiv='Refresh' content='0;URL=#{url}'&gt;"

      # or we could just skip all the output specification and do something nicer for this case:
      context.browser.open url, :new_window => true, :title => "Documentation for #{context.selection}"
    end
    # some alternate forms for cmd.invoke:
    cmd.invoke[:windows] = "cmdline"
    cmd.invoke = "cross-platform commandline"
    cmd.invoke = case rr.platform
                 when :win32 "windows cmdline"
                 else "normal cmdline"
                 end
  end
end
