class Quality

  def self.update(item, amount)
    self.is_degrading?(item) ? item.quality -= amount : item.quality += amount
  end

  def self.is_degrading?(item)
    item.name !~ /^[ABS]/
  end
end
