# encoding: utf-8
class MyApp < Sinatra::Application
  
  before do
    # Load in the pass data before each request
    DB = Sequel.sqlite("data/pass_server.sqlite3")
    @passes ||= DB[:passes]
    @registrations ||= DB[:registrations]
  end
  
  
	post "/deposits" do
		@title = "Bitchallenge"			
    @quantity=params[:amount]
    @from=params[:from]
    @user=params[:name]
		haml :deposit_show
	end
end