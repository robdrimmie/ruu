require 'xmpp4r/client'
include Jabber

class HomeController < ApplicationController
 def index
  #Jabber::debug = true # Uncomment this if you want to see what's being sent and received!
  jid = JID::new('rob.drimmie@gmail.com')
  password = 'fake';
logger.debug( "foo" );  
  cl = Client::new(jid)
  cl.connect
  cl.auth(password)

  to = "rob.drimmie@gmail.com"
  subject = "XMPP4R test"
  body = "Hi, this is my first try from XMPP4R!!!"
  m = Message::new(to, body).set_type(:chat).set_id('1').set_subject(subject)
  cl.send m

  return render :text => "The object is #{cl}"


 end

end
