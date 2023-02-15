class CashRegister
  attr_reader :discount, :items
  attr_accessor :total

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    if quantity > 1
      quantity.times do { self.items << title } 
    else
      self.items << title
    end
  end

  def apply_discount
    if discount > 0 && total
      self.total = (self.total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end
  
end