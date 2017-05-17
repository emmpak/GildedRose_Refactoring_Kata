class Quality

  MAX = 50

  def self.update(item, amount)
    self.is_degrading?(item) ? item.quality -= amount : item.quality += amount
  end

  def self.is_degrading?(item)
    item.name !~ /^[ABS]/
  end
end


# self.find_amount(item)
#   self.max?(item) ? 0 : (self.min?(item) ? 1 : 2)
