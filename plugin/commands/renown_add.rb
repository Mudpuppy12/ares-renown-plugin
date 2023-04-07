module AresMUSH

  module Renown
    class RenownAddCmd
      include CommandHandler

      attr_accessor :name, :title, :value

      def parse_args
        args = cmd.parse_args(ArgParser.arg1_slash_arg2_equals_arg3)
        self.name = trim_arg(args.arg1)
        self.title = trim_arg(args.arg2)
        self.value = trim_arg(args.arg3)
      end

      def required_args
        [ self.name, self.title, self.value ]
      end

      def handle

           if !(enactor.is_admin?)
              client.emit_failure "You're not allowed to do that.\n"
              return
           end

        Renown.add_entry(self.name, self.title, self.value, enactor.name)
        client.emit "You add a new entry to the list.\n"
      end

    end
  end

end
