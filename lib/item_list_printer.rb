require 'item_printer'

# ItemListPrinter
module ItemListPrinter
  def self.to_string(items, item_printer = ItemPrinter)
    items.each_with_index
         .map { |item, index| item_printer.to_string(item, index + 1) }
         .join("\n")
  end

  def self.to_summary(items, keys, item_printer = ItemPrinter)
    items.each_with_index
         .map { |item, index| item_printer.to_summary(item, keys, index + 1) }
         .join("\n")
  end
end
