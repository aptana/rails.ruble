require 'radrails'

with_defaults { :scope => "source.ruby.rails" }
do |bundle|

  snippet "validates_acceptance_of if (vaoif)" do |snippet|
    snippet.trigger = "vaoif"
    snippet.expansion = "validates_acceptance_of :${1:terms}${2:${3:, :accept => '${4:1}'}${5:, :message => '${6:You must accept the terms of service}'}}, :if => proc { |obj| ${7:obj.condition?} }}"
  end

  snippet "validates_acceptance_of (vao)" do |snippet|
    snippet.trigger = "vao"
    snippet.expansion = "validates_acceptance_of :${1:terms}${2:${3:, :accept => '${4:1}'}${5:, :message => '${6:You must accept the terms of service}'}}"
  end

  snippet "validates_associated (va)" do |snippet|
    snippet.trigger = "va"
    snippet.expansion = "validates_associated :${1:attribute}${2:, :on => :${3:create}}"
  end

  snippet "validates_associated if (vaif)" do |snippet|
    snippet.trigger = "vaif"
    snippet.expansion = "validates_associated :${1:attribute}${2:, :on => :${3:create}}, :if => proc { |obj| ${5:obj.condition?} }}"
  end

  snippet "validates_confirmation_of (vc)" do |snippet|
    snippet.trigger = "vc"
    snippet.expansion = "validates_confirmation_of :${1:attribute}${2:, :on => :${3:create}, :message => '${4:should match confirmation}'}"
  end

  snippet "validates_confirmation_of if (vcif)" do |snippet|
    snippet.trigger = "vcif"
    snippet.expansion = "validates_confirmation_of :${1:attribute}${2:, :on => :${3:create}, :message => '${4:should match confirmation}'}, :if => proc { |obj| ${5:obj.condition?} }}"
  end

  snippet "validates_exclusion_of (ve)" do |snippet|
    snippet.trigger = "ve"
    snippet.expansion = "validates_exclusion_of :${1:attribute}${2:, :in => ${3:%w( ${4:mov avi} )}, :on => :${5:create}, :message => '${6:extension %s is not allowed}'}"
  end

  snippet "validates_format_of if (vfif)" do |snippet|
    snippet.trigger = "vfif"
    snippet.expansion = "validates_format_of :${1:attribute}, :with => /${2:^[${3:\w\d}]+\$}/${4:, :on => :${5:create}, :message => '${6:is invalid}'}, :if => proc { |obj| ${7:obj.condition?} }}"
  end

  snippet "validates_format_of (vf)" do |snippet|
    snippet.trigger = "vf"
    snippet.expansion = "validates_format_of :${1:attribute}, :with => /${2:^[${3:\w\d}]+\$}/${4:, :on => :${5:create}, :message => '${6:is invalid}'}"
  end

  snippet "validates_inclusion_of if" do |snippet|
    snippet.trigger = "viif"
    snippet.expansion = "validates_inclusion_of :${1:attribute}${2:, :in => ${3:%w( ${4:mov avi} )}, :on => :${5:create}, :message => '${6:extension %s is not included in the list}'}, :if => proc { |obj| ${7:obj.condition?} }}"
  end

  snippet "validates_inclusion_of" do |snippet|
    snippet.trigger = "vi"
    snippet.expansion = "validates_inclusion_of :${1:attribute}${2:, :in => ${3:%w( ${4:mov avi} )}, :on => :${5:create}, :message => '${6:extension %s is not included in the list}'}"
  end

  snippet "validates_length_of" do |snippet|
    snippet.trigger = "vl"
    snippet.expansion = "validates_length_of :${1:attribute}, :within => ${2:3..20}${3:, :on => :${4:create}, :message => '${5:must be present}'}"
  end

  snippet "validates_length_of if" do |snippet|
    snippet.trigger = "vlif"
    snippet.expansion = "validates_length_of :${1:attribute}, :within => ${2:3..20}${3:, :on => :${4:create}, :message => '${5:must be present}'}, :if => proc { |obj| ${6:obj.condition?} }}"
  end

  snippet "validates_numericality_of" do |snippet|
    snippet.trigger = "vn"
    snippet.expansion = "validates_numericality_of :${1:attribute}${2:, :on => :${3:create}, :message => '${4:is not a number}'}"
  end

  snippet "validates_numericality_of if" do |snippet|
    snippet.trigger = "vnif"
    snippet.expansion = "validates_numericality_of :${1:attribute}${2:, :on => :${3:create}, :message => '${4:is not a number}'}, :if => proc { |obj| ${5:obj.condition?} }}"
  end

  snippet "validates_presence_of" do |snippet|
    snippet.trigger = "vp"
    snippet.expansion = "validates_presence_of :${1:attribute}${2:, :on => :${3:create}, :message => '${4:can't be blank}'}"
  end

  snippet "validates_presence_of if" do |snippet|
    snippet.trigger = "vpif"
    snippet.expansion = "validates_exclusion_of :${1:attribute}${2:, :in => ${3:%w( ${4:mov avi} )}, :on => :${5:create}, :message => '${6:extension %s is not allowed}'}, :if => proc { |obj| ${5:obj.condition?} }"
  end

  snippet "validates_uniqueness_of" do |snippet|
    snippet.trigger = "vu"
    snippet.expansion = "validates_uniqueness_of :${1:attribute}${2:, :on => :${3:create}, :message => '${4:must be unique}'}"
  end

  snippet "validates_uniqueness_of if" do |snippet|
    snippet.trigger = "vuif"
    snippet.expansion = "validates_uniqueness_of :${1:attribute}${2:, :on => :${3:create}, :message => '${4:must be unique}'}, :if => proc { |obj| ${6:obj.condition?} }}"
  end

end
