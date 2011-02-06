require 'xmpp4r/client'
require 'xmpp4r/presence'

include Jabber

class HomeController < ApplicationController
  def index
    if params[:address] && '' != params[:address]
      send_auth( params[:address] )
      return render :text => "Send, probably"
    end
  end

  def send_auth(target)
    #Jabber::debug = true # Uncomment this if you want to see what's being sent and received!
    jid = JID::new('robtesttwo@gmail.com')
    password = 'fake';
    cl = Client::new(jid)
    cl.connect
    cl.auth(password)

    @pres = Presence.new.set_type(:subscribe).set_to( target )
    cl.send(@pres)
 
    subject = "XMPP4R test"
    body = "Hi, this is my first try from XMPP4R!!!"
    m = Message::new(target, body).set_type(:chat).set_id('1').set_subject(subject)
    cl.send m

    #return render :text => "The object is #{cl}"
  end

end
