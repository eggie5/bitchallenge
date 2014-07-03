require 'rubygems' 
require 'bundler/setup'
require "test/unit"
require 'coinbase'

require_relative "../lib/deposit"
require_relative "../workers/sell_worker"

$coinbase = Coinbase::Client.new("xxx", "yyy")


class TestLibDeposit < Test::Unit::TestCase
  def setup
    @d=Deposit.new(from: "xxxx", to: "yyyy", date: Date.new, 
      status: Deposit::STATUS[:pending], quantity: 1.2, sell_price: 600.05, trans_id: "234kj", user:"alex",
      confirmed:false )
   end
  
  def test_new_deposit
    #user submits the form that says they will transfer x BTC to my address on coinbase
    #the deposit is made in the setup method
    assert_equal @d.status, Deposit::STATUS[:pending]
    
    #spin-off Verification Worker
    #verification worker will check if a deposit has been confirmed on the blockchain
    
  end
  
  #the logic of the sell worker is simple
  #it will check if the sell price NOW is greater
  # than the sell price when you deposited teh BTC in this app (plus a threshold: TOL)
  def test_sell_worker
    worker=SellWorker.new
    worker.perform @d
    
    assert_equal @d.status, Deposit::STATUS[:complete] 
  end
end