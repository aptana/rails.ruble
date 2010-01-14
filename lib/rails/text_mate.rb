# Copyright:
#   (c) 2006 syncPEOPLE, LLC.
#   Visit us at http://syncpeople.com/
# Author: Duane Johnson (duane.johnson@gmail.com)
# Description:
#   Helper module for accesing RadRails facilities such as environment variables.

require 'uri'
require 'radrails/editor'

module RadRails
  class <<self

    # Open a file in RadRails.  Uses 0-based line and column indices.
    def open(filename, line_number = nil, column_number = nil)
      filename = filename.filepath if filename.is_a? RailsPath
      options = {}
      options[:file] = URI.escape(filename)
      options[:line] = line_number + 1 if line_number
      options[:column] = column_number + 1 if column_number
      RadRails::Editor.go_to options
    end

    # Always return something, or nil, for selected_text
    def selected_text
      env(:selected_text)
    end

    # Make line_number 0-base index
    def line_number
      env(:line_number).to_i - 1
    end

    # Make column_number 0-base as well
    def column_number
      env(:column_number).to_i - 1
    end

    def project_directory
      env(:project_directory)
    end

    def env(var)
      ENV['TM_' + var.to_s.upcase]
    end
    
    # Forward to the TM_* environment variables if method is missing.  Some useful variables include:
    #   selected_text, current_line, column_number, line_number, support_path
    def method_missing(method, *args)
      if value = env(method)
        return value
      else
        super(method, *args)
      end
    end
  end
end
