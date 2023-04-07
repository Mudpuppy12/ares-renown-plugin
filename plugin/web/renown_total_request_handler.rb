module AresMUSH
  module Renown
    class RenownTotalRequestHandler
      def handle(request)

        fields = Global.read_config("renown", "web_renown_total_fields")
        titles = fields.map { |f| f['title'] }
        titles << 'Renown'
        chars = Renown.get_renown_chars.sort_by { |c| c.name}

        people = []
        charnames = []
        types = Renown.standard_types
        
        chars.each do |c|
          char_data = {}
          char_data['char'] = {
               name: c.name,
               icon:  Website.icon_for_char(c)  }
          fields.each do |field_config|
            field = field_config["field"]
            title = field_config["title"]
            value = field_config["value"]

            char_data[title] = Renown.general_field(c, field, value)
          end
          char_data['Renown'] = Renown.prettify(Renown.calculate_gained(c.name))
          
          people << char_data
          charnames << c.name
        end
        
        {
          titles: titles,
          people: people,
          charnames: charnames,
          standard_types: types
        }
      end
    end
  end
end
