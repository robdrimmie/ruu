= Are You You?

== Overview/plan
A little toy application/experiment.

Enter your XMPP-addressible chat client user name (eg, jabber or gtalk account) into the form and a message will be sent to your IM client asking if you are who you say you are. Responding affirmatively through the chat client will authenticate the browser session.

== Current State
I, uh, kind of don't remember exactly what state the response to the form is in. I had it to the point where it would send a message to an account where both sides have already approved each other in the roster, but I might have broken it while playing.

the /play folder contains a simple client script where I have been figuring out the workflow of sending a request for xmpp auth, being added to the roster, and sending the actual message. It is pretty lightweight, but demonstrates the proof of concept.

For now I have shelved development because I need a long-running client process to handle the xmpp side of things and that needs to talk to a database to store and share state with the Rails side, and there's no point in not using ActiveRecord for that, but figuring out how to make use of ActiveRecord in a non-Rails app, while I'm sure not hard, is best served by working on a few standard web app type ideas in Rails until I start understanding the framework (and ruby itself) better.
