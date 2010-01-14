# Copyright:
#   (c) 2006 syncPEOPLE, LLC.
#   Visit us at http://syncpeople.com/
# Author: Duane Johnson (duane.johnson@gmail.com)
# Description:
#   Collection of Rails / TextMate classes for Ruby.

# FIXME We don't have env vars set when we load bundle!
if ENV['TM_BUNDLE_SUPPORT']
  bundle_lib = ENV['TM_BUNDLE_SUPPORT'] + '/lib'
  $LOAD_PATH.unshift(bundle_lib) if !$LOAD_PATH.include?(bundle_lib)
end

# FIXME We haven't ported over the equivalent of exit_codes lib/support file yet!
#require 'radrails/exit_codes'
require 'radrails/ui'

require 'rails/text_mate'
require 'rails/rails_path'
require 'rails/misc'
require 'rails/inflector'

def ruby(command)
  `/usr/bin/env ruby #{command}`
end
