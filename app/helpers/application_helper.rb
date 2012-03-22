require 'uri'

module ApplicationHelper

  def get_bookmarklet(file, hash)
    js = File.open( "#{Rails.root}/app/assets/javascripts/#{file}", 'r' ).read

    js.gsub!( /\/\*.+?\*\/|\/\/.*(?=[\n\r])/, '' )  # Kill comments.
    js.gsub!( /s{\t}{ }gm/, '')         # Tabs to spaces
    js.gsub!( /s{ +}{ }gm/, '')         # Space runs to one space
    js.gsub!( /s{^\s+}{}gm/, '')        # Kill line-leading whitespace
    js.gsub!( /s{\s+$}{}gm/, '')        # Kill line-ending whitespace
    js.gsub!( /s{\n}{}gm/, '')          # Kill newlines

    hash.each_pair do |k,v|
      js.gsub!("{{#{k.to_s}}}", v)
    end

    js = URI.escape(js)
    "javascript:(function(){#{js}}());"
  end

  def clean_quotes(string)
    string = string.to_s.gsub(/[,"]/,'')
    string = string.gsub(/[,']/,'')
    string
  end
end
