class Deposit
  STATUS= {pending: "pending", completed: "completed"}
  
  attr_accessor :status, :quantity, :sell_price
  def initialize(args)
    @status=args[:status]
    @quantity=args[:quantity]
    @sell_price=args[:sell_price]
    @user=args[:user]
    @confimred=args[:confirmed]
  end
  
  
end

