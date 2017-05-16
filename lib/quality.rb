class Quality

  def update(item)
    # item.quality +=1 if
  end

  def self.is_degrating?(item)
    item.name !~ /^[ABS]/
  end
end
