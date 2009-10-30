require 'radrails'

# its ruby, so this just addscommands/snippets in bundle (or replaces those with same name)
# many ruby files could add to a single bundle
RadRails.bundle "MyBundle" do |rr|
  rr.author = "Andrew Shebanow"
  rr.copyright = "© Copyright 2009 Aptana Inc."

  rr.description = "Rails bundle, based heavily on Dr. Nic's tmbundle (http://github.com/drnic/ruby-on-rails-tmbundle)"

  rr.git_repo = "git://github.com/aptana/rrbundle_rails.git"

end
