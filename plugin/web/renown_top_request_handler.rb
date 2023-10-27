module AresMUSH
  module Renown
    class RenownTopRequestHandler
      def handle(request)

        topchars = Renown.get_top_list("char",10)
        toporgs = Renown.get_top_list(Renown.group,10)
        title = Renown.title
        org_header = Renown.plural(Renown.group).titleize
        show_org_links = Global.read_config("renown","org_links")
        org_page_prefix = Global.read_config("renown","org_page_prefix")
        org_page_prefix = (org_page_prefix == {}) ? "" : org_page_prefix

        {
          chars: topchars,
          orgs: toporgs,
          renown_title: title,
          orgname: org_header,
          show_links: show_org_links,
          org_prefix: org_page_prefix
        }
      end

    end
  end
end
