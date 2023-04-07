module AresMUSH
  module Renown
    class RenownGroupTemplate < ErbTemplateRenderer
      
      attr_accessor :chars
      
      def initialize(chars,house)
        @chars = chars
        @house = house
        super File.dirname(__FILE__) + "/renown_group.erb"
      end

      def house_title
         title = "House " + @house + " - Renown"
         return title
      end
      
      def house_chars
        list = []
        @chars.each do |c|
          list << "%r#{left(c[0],30)} #{left(c[1],19)} #{right(Renown.prettify(c[2]),15)}"
        end
        list
      end

      def house_total
        total = Renown.calculate_house_total(@house)
        title = "Total"
        line = "#{left(title,50)} #{right(Renown.prettify(total),15)}"
      end

    end
  end
end
