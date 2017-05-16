class Quality

  def is_degrating?(item)
    item.name !~ /^[ABS]/
  end
end
