module AresMUSH
  module Renown
    class RenownTopRequestHandler
      def handle(request)

        topchars = Renown.get_top_list("char",10)
        toporgs = Renown.get_top_list(Renown.group,10)
        title = Renown.title
        org_header = Renown.plural(Renown.group).titleize

        {
          chars: topchars,
          orgs: toporgs,
          renown_title: title,
          orgname: org_header
        }
      end

    end
  end
end
