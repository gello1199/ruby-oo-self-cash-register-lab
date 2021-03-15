require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount=0)
        @total = 0
        @discount = discount  
        @items = []
    end

    def add_item(title, price, quantity = 1)
        count = 1 
        while count <= quantity #use while because we want to count titles that appear more than once
            @items << title
            count += 1
            # binding.pry
        end

        @last_item = price * quantity
        
        @total += price * quantity

    end

    def apply_discount
        if  @discount == 0
            "There is no discount to apply."
        else
            @total -= @total * @discount / 100
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
       void_item = @items.pop(1)
       @total -= @last_item
    end
    
    # new_eggs = CashRegister.new
    #  new_eggs.add_item("eggs", 1.25, 2)
    #  new_cheese = CashRegister.new
    #  new_cheese.add_item("cheese", 1.50, 2)
    #   binding.pry
end
