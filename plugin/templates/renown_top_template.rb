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
         title_chars = "Top 10 Characters (" + Renown.title + ")"
         title_orgnames = "Top 10 " + Renown.plural(Renown.group).titlecase + " (" + Renown.title + ")"
         title = "#{center(title_chars,39)} #{center(title_orgnames,39)}"
         return title
      end
      
      def top_entries
        entry = ""
        list = []
        len = @chars.length
        for i in 0..(len-1) do
          if chars[i]
             entry = " #{right(i+1,2)}:  #{left(@chars[i][:name],19)} #{right(@chars[i][:total],10)}"
          else
             entry = "                                    "
          end
          if orgs[i]
             entry = entry + "    %x!|%xn  " + "#{right(i+1,2)}:  #{left(@orgs[i][:name],16)} #{right(@orgs[i][:total],10)}%r"
          else
             entry = entry + "    %x!|%xn   %r"
          end
          list << entry
        end
        list
      end

    end
  end
end
