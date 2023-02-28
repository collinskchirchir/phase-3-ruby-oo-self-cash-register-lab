class CashRegister
  attr_reader :discount
  attr_accessor :total , :title, :price, :items ,:last_transaction

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title , price, quantity=1)
    @price = price
    @total += price*quantity
    @last_transaction = price*quantity
    quantity.times { self.items << title}
  end

  def apply_discount
    if @discount> 0
        item_discount = @price*@discount /100
        @total -= item_discount
        "After the discount, the total comes to $#{@total}."
    else
        "There is no discount to apply."
    end
  end

  def void_last_transaction 
    @items.size == 0? @total = 0 : @total-= @last_transaction
  end
  
end