module AresMUSH
  module Renown
    class RenownOrgsRequestHandler
      def handle(request)
        Renown.renown_orgs(Renown.group)
      end
    end
  end
end
