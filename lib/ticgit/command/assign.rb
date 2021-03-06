module TicGit
  module Command
    # Assigns a ticket to someone
    #
    # Usage:
    # ti assign             (assign checked out ticket to current user)
    # ti assign {1}         (assign ticket to current user)
    # ti assign -c {1}      (assign ticket to current user and checkout the ticket)
    # ti assign -u {name}   (assign ticket to specified user)
    module Assign
      def parser(opts)
        opts.banner = "Usage: ti assign [options] [ticket_id]"
        opts.on_head(
          "-u USER", "--user USER", "Assign the ticket to this user"){|v|
          options.user = v
        }
        opts.on_head(
          "-c TICKET", "--checkout TICKET", "Checkout this ticket"){|v|
          options.checkout = v
        }
      end

      def handle_ticket_assign
        tic.ticket_checkout(options.checkout) if options.checkout

        tic_id = args[0]
        tic.ticket_assign(options[:user], tic_id)
      end
    end
  end
end
