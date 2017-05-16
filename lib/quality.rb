class Quality

  def self.update(item)
    item.quality -= 1 if self.is_degrading?(item)
  end

  def self.is_degrading?(item)
    item.name !~ /^[ABS]/
  end
end
