# encoding: utf-8
class MyApp < Sinatra::Application
  
  before do
    # Load in the pass data before each request
    DB = Sequel.sqlite("data/pass_server.sqlite3")
    @passes ||= DB[:passes]
    @registrations ||= DB[:registrations]
  end
  
  
	get "/" do
		@title = "Bitchallenge"				
		haml :main
	end
end