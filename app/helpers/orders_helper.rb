module OrdersHelper
  def total_order_cost oi_array
    total = 0
    oi_array.each do |oi|
      total += oi.item.price
    end
    total
  end

  
end
