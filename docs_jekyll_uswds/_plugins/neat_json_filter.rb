require 'neatjson'

module Jekyll
  class NeatJsonTagBlock < Liquid::Block

    def render(context)
      begin
        text = super
        JSON.neat_generate(text, wrap: 50, after_comma: 1, after_colon: 1)
      rescue JSON::GeneratorError => e
        "Error: #{e}."
      end
    end
  end
end

Liquid::Template.register_tag('neat_json', Jekyll::NeatJsonTagBlock)

# USAGE:
# {{ site.data.user | neat_json }}
# 
# neatjson formatting options: https://github.com/Phrogz/NeatJSON#options
