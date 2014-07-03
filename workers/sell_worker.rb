#this will be a sidekiq worker
class SellWorker
  TOL=Money.new(5, "USD")
  
  def perform(deposit)
    d=deposit
    p d.quantity #how many satoshis we have
    #check if the sell price for x satoshis on coinbase is larger than we have
    #if true, then sell
    
    last_sell_price = Money.new(d.sell_price, "USD")
    current_sell_price = $coinbase.sell_price(d.quantity) 
    
    if current_sell_price + TOL > last_sell_price
      r = $coinbase.sell!(d.quantity)
      r.transfer.code
      r.transfer.btc.format
      r.transfer.total.format
      r.transfer.payout_date
      
      #update status
      d.status=Deposit::STATUS[:completed]
    end
  end
end