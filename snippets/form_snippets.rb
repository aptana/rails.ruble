require 'ruble'

with_defaults :scope => "text.html.ruby, text.haml" do |bundle|

  snippet "form_for check_box" do |snippet|
    snippet.trigger = [ "f.", "ffcb" ]
    snippet.expansion = "f.check_box :${1:attribute}"
  end

  snippet "form_for fields_for" do |snippet|
    snippet.trigger = [ "f.", "nff" ]
    snippet.expansion = "f.fields_for :${1:attribute} do |${2:f}|"
  end

  snippet "form_for file_field" do |snippet|
    snippet.trigger = [ "f.", "ffff" ]
    snippet.expansion = "f.file_field :${1:attribute}"
  end

  snippet "form_for hidden_field" do |snippet|
    snippet.trigger = [ "f.", "ffhf" ]
    snippet.expansion = "f.hidden_field :${1:attribute}"
  end

  snippet "form_for label" do |snippet|
    snippet.trigger = [ "f.", "ffl" ]
    snippet.expansion = "f.label :${1:attribute}${2:, \"${3:${1/[[:alpha:]]+|(_)/(?1: :\u$0)/g}}\"}"
  end

  snippet "form_for password_field" do |snippet|
    snippet.trigger = [ "f.", "ffpf" ]
    snippet.expansion = "f.password_field :${1:attribute}"
  end

  snippet "form_for radio_button" do |snippet|
    snippet.trigger = [ "f.", "ffrb" ]
    snippet.expansion = "f.radio_button :${1:attribute}, :${2:tag_value}"
  end

  snippet "form_for submit" do |snippet|
    snippet.trigger = [ "f.", "ffs" ]
    snippet.expansion = "f.submit \"${1:Submit}\"${2:, :disable_with => '${3:$1ing...}'}"
  end

  snippet "form_for text_area" do |snippet|
    snippet.trigger = [ "f.", "ffta" ]
    snippet.expansion = "f.text_area :${1:attribute}"
  end

  snippet "form_for text_field" do |snippet|
    snippet.trigger = [ "f.", "fftf" ]
    snippet.expansion = "f.text_field :${1:attribute}"
  end

  snippet "form_for with errors" do |snippet|
    snippet.trigger = "ffe"
    snippet.expansion = "error_messages_for :${1:model}\nform_for @${2:$1} do |f|\n$0\n"
  end

  snippet "form_for" do |snippet|
    snippet.trigger = "ff"
    snippet.expansion = "form_for @${1:model} do |f|\n$0\n"
  end

end
