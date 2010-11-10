module Rails
class ContentAssistant
  def initialize(io, offset)
    @src = io.read
    @offset = offset
  end
  
  def assist
    suggestions = []
    # TODO Only do rails specific CA here! Now ruby CA should work!
    if prefix.start_with? "@"
      dir_name = filepath.removeLastSegments(1).lastSegment
      results = index.query([com.aptana.editor.ruby.index.IRubyIndexConstants::FIELD_DECL], prefix, com.aptana.index.core.SearchPattern::PREFIX_MATCH | com.aptana.index.core.SearchPattern::CASE_SENSITIVE)
      results.each {|r| suggestions << r.word if !r.documents.select {|d| d.end_with? "#{dir_name}_controller.rb" }.empty? } if results # TODO Limit to only words found in the matching controller!
    else
      # Load up helper methods!
      docs = []
      # First we find all the helper modules and record the files they're in...
      # FIXME Include project index here too
      gem_and_project_indices.each do |index|
        results = index.query([com.aptana.editor.ruby.index.IRubyIndexConstants::TYPE_DECL], "^\\w+?Helper/([\\w:]*)?/M$", com.aptana.index.core.SearchPattern::REGEX_MATCH | com.aptana.index.core.SearchPattern::CASE_SENSITIVE)
        results.each {|r| r.getDocuments.each {|d| docs << d } } if results
      end
      docs.flatten!
      Ruble::Logger.trace "Found helpers in documents: #{docs.join(', ')}"
      # Now we look for all methods matching the prefix and then post-filter to only those defined in the helper's files.
      gem_and_project_indices.each do |index|
        results = index.query([com.aptana.editor.ruby.index.IRubyIndexConstants::METHOD_DECL], prefix, com.aptana.index.core.SearchPattern::PREFIX_MATCH | com.aptana.index.core.SearchPattern::CASE_SENSITIVE)
        (results || []).each do |r|
          r.getDocuments.each {|d| suggestions << r.word.split('/').first if docs.include?(d) } # FIXME Break early when we have a match here
        end
      end
    end
    suggestions.flatten!
    suggestions.uniq!
    suggestions = suggestions.select {|s| s }
    suggestions.sort!
    Ruble::Logger.trace "Rails content assist suggestions: #{suggestions.inspect}"
    suggestions.inspect
  end
  
  private
  def parser
    @parser ||= org.jrubyparser.Parser.new
  end
  
  def parser_config
    org.jrubyparser.parser.ParserConfiguration.new(0, org.jrubyparser.CompatVersion::RUBY1_8)
  end
  
  def get_children_recursive(parent, type)
    children = parent.getChildrenOfType(type) 
    partial = []
    children.each {|c| partial << c; partial << get_children_recursive(c, type) }
    partial.flatten!
    partial
  end
  
  def filepath
    org.eclipse.core.runtime.Path.new(ENV['TM_FILEPATH'])
  end
  
  def gem_and_project_indices
    gem_indices << index
  end
  
  def gem_indices
    gem_paths = com.aptana.editor.ruby.CoreStubber.getGemPaths
    gem_paths.collect {|g| index_manager.getIndex(g.toFile.toURI) }.compact
  end
  
  def index
    file = org.eclipse.core.resources.ResourcesPlugin.workspace.root.getFileForLocation(filepath)
    project = file.project
    index_manager.getIndex(project.locationURI)
  end
  
  def offset
    @offset
  end
  
  def prefix
    return @prefix if @prefix
    @prefix = @src[0...offset + 1]

    # find last period/space/:
    index = @prefix.rindex('.')
    @prefix = @prefix[(index + 1)..-1] if !index.nil?

    index = @prefix.rindex(':')
    @prefix = @prefix[(index + 1)..-1] if !index.nil?

    index = @prefix.rindex(' ')
    @prefix = @prefix[(index + 1)..-1] if !index.nil?

    return @prefix
  end
  
  def full_prefix
    return @full_prefix if @full_prefix
    @full_prefix = @src[0...offset + 1]

    # find last space/newline
    index = @full_prefix.rindex(' ')
    @full_prefix = @full_prefix[(index + 1)..-1] if !index.nil?
    
    index = @full_prefix.rindex('\n')
    @full_prefix = @full_prefix[(index + 1)..-1] if !index.nil?
    
    index = @full_prefix.rindex('\r')
    @full_prefix = @full_prefix[(index + 1)..-1] if !index.nil?
    
    index = @full_prefix.rindex('\t')
    @full_prefix = @full_prefix[(index + 1)..-1] if !index.nil?

    return @full_prefix
  end
end
end