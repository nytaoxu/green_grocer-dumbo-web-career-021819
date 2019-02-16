def consolidate_cart(cart)
  # code here
  result = Hash.new
  cart.each do |item|
    item.each do |name, info|
      match = false
      result.each do |r_name, status|
        if r_name == name
          match = true
          status[:count] += 1
        end
      end
      if match == false
        info[:count] = 1
        result[name] = info
      end
    end
  end
  result
end

def apply_coupons(cart, coupons)
  # code here
  result = Hash.new
  coupons.each do |coupon|
    cart.each do |name, info|
      result[name] = info
      if name == coupon[:item] && info[:count] >= coupon[:num]
        info[:count] -= coupon[:num]
        new_name = name + " W/COUPON"
        if !result[new_name]
          result[new_name] = {
            :price => coupon[:cost],
            :clearance => info[:clearance],
            :count => 1
          }
        else
          result[new_name][:count] += 1
        end
         
      end
    end
  end
  result
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
