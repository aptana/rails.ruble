require 'radrails'

# its ruby, so this just addscommands/snippets in bundle (or replaces those with same name)
# many ruby files could add to a single bundle
RadRails.current_bundle do |bundle|
  bundle.name = "MyBundle"
  bundle.author = "Andrew Shebanow"
  bundle.copyright = "© Copyright 2009 Aptana Inc."

  bundle.description = "Rails bundle, based heavily on Dr. Nic's tmbundle (http://github.com/drnic/ruby-on-rails-tmbundle)"

  bundle.git_repo = "git://github.com/aptana/rrbundle_rails.git"
end
