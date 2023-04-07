module AresMUSH
  module Renown
    class RenownTopRequestHandler
      def handle(request)

        topchars = Renown.get_top_list("char",10)
        toporgs = Renown.get_top_list(Renown.group,10)

        {
          chars: topchars,
          orgs: toporgs
        }
      end
    end
  end
end
