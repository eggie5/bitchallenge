bitchallenge
============

deposit bitcoins and then sell at a higher price (dollar value)

#Design
This app is based around two worker processes: Verification and Sell workers. The verification worker verifies that the user did infact transfer the BTC to our exchange wallet. This is done via exchange APIS and checking the block chain. The Sell worker then periodicly checks to see if the current sell price will result in a certain amount of profit and will then exectute the sell.

* There are a few tests in the test directory
* replace the keys in config/keys w/ your own keys

!!! This is a work in progress

#setup
Install gems:
`bundle install`

This is a sinatra app. To setup the database (sqlite3) run :
`./lib/server_ctl -s_`

To run:
`rackup`

This app is still under development!


