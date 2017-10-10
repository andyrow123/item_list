module ItemPrinter
  def self.to_string(item, index)
    str = "#{index}. "
    str << item.keys.map { |key|
      "#{item[key]}          "
    }.join
  end

  def self.to_summary(item, keys, index)
    str = "#{index}. "
    str << keys.map { |key|
      "#{item[key]}          "
    }.join
  end
end