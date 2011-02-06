require 'rubygems'
require 'xmpp4r/client'
require 'xmpp4r/roster'
require 'xmpp4r/presence'

include Jabber

Jabber::debug = true

class BasicClient
  def initialize
    puts "Welcome to this Basic Console Jabber Client!"
    quit = false
    # main loop
    while not quit do
      print "> "
      $defout.flush
      line = gets
      quit = true if line.nil?
      if not quit
        command, args = line.split(' ', 2)
        args = args.to_s.chomp
        # main case
        case command
        when 'exit'
          quit = true
        when 'connect'
          acct = 'areyouyoubot@gmail.com'
          pw = 'fake'
          args = acct + ' ' + pw
          do_connect(args)
        when 'help'
          do_help
        when 'auth'
          do_auth
        when 'add'
          do_add
        when 'send'
          do_send(args)
        else
          puts "Command \"#{command}\" unknown"
        end
      end
    end
    puts "Goodbye!"
  end

  def do_help
    puts <<-EOF
# exit - exits
# connect user@server/resource password - connects
# auth - sends authentification
    EOF
  end

  ##
  # connect <jid> <password>
  def do_connect(args)
    @jid, @password = args.split(' ', 2)
    @jid = JID.new(@jid)
    @cl = Client.new(@jid)
    @cl.connect

    @cl.add_message_callback do |m| 
      puts m.body
    end
    #@cl.
  end

  ##
  # auth
  def do_auth
    puts @password
    @cl.auth(@password)
  end

  def do_add
    @pres = Presence.new.set_type(:subscribe).set_to("rob.drimmie@gmail.com")
    @cl.send(@pres)
    
  end

  def do_send(msg)
    msg = Message::new( 'rob.drimmie@gmail.com', 'Hi me' )
    msg.type = :chat
    @cl.send(msg)
  end
end

BasicClient.new

