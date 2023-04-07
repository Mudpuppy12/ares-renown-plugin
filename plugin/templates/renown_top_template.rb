module AresMUSH
  module Renown
    class RenownTopTemplate < ErbTemplateRenderer
      
      attr_accessor :chars, :orgs
      
      def initialize(chars,orgs)
        @chars = chars
        @orgs = orgs
        super File.dirname(__FILE__) + "/renown_top.erb"
      end

      def top_title
         title = "Top 10 - Characters with Highest Renown    Top 10 - " + Renown.group.titlecase + "s with Highest Renown"
         return title
      end
      
      def top_entries
        entry = ""
        list = []
        for i in 0..9 do
          if chars[i]
             entry = " #{right(i+1,2)}:  #{left(chars[i][:name],19)} #{right(Renown.prettify(chars[i][:total]),10)}"
          else
             entry = "                                    "
          end
          if orgs[i]
             entry = entry + "    %x!||%xn  " + "#{right(i+1,2)}:  #{left(orgs[i][:name],16)} #{right(Renown.prettify(orgs[i][:total]),10)}%r"
          else
             entry = entry + "    %x!||%xn   %r"
          end
          list << entry
        end
        list
      end

    end
  end
end
