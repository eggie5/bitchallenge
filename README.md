bitchallenge
============

This app will sell your bitcoins for a value higher price than your original buy price

#Design
This app is based around two worker processes: Verification and Sell workers. The verification worker verifies that the user did infact transfer the BTC to our exchange wallet. This is done via exchange APIs and checking the block chain via the chain.com APIs. The Sell worker then periodicly checks to see if the current sell price will result in a certain amount of profit and will then exectute the sell on coinbase.

* There are a few tests in the test directory
* replace the keys in config/keys w/ your own keys




#setup
Install gems:
`bundle install`

This is a sinatra app. To setup the database (sqlite3) run :
`./lib/server_ctl -s`

To run:
`rackup`

This app is still under development!


