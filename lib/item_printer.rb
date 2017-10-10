##
# This module takes in an item and returns a string.
module ItemPrinter
  def self.to_string(item, index)
    str = "#{index}. "
    str << item.keys.map { |key| item[key].to_s }.join(' ')
  end

  def self.to_summary(item, keys, index)
    str = "#{index}. "
    str << keys.map { |key| item[key].to_s }.join(' ')
  end
end
