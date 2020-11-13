require "pry"
class CashRegister

    attr_accessor :total, :discount, :last_transaction_amount, :items, :quantity
  
    def initialize(discount = 0)
      self.total = 0
      self.discount = discount
      self.items = []
    end
  
  
    def add_item(title,price,quantity = 1)
      # if quantity>1
        i=0
        while i<quantity
          items << title
          i+=1
        end
      # else
      #   @items << title
      # end
      self.total += price*quantity
      self.last_transaction_amount = price*quantity
      self.quantity = quantity
    end
  
    def apply_discount()
      if discount > 0
        self.discount = discount/100.to_f
        self.total = total - (total * (discount))
        "After the discount, the total comes to $#{total.to_i}."
      else
        "There is no discount to apply."
      end
    end
  
  
    def void_last_transaction()
      self.total -= last_transaction_amount
      quantity.times {items.pop}
      
    end
  
  end
