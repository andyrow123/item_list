require 'item_list_printer'

class List
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add(item)
    fail 'Already exists in list' if found?(item)
    @items << item
    'Success'
  end

  def remove(item)
    fail 'Not found in list' unless found?(item)
    @items.delete(item)
    'Success'
  end

  def to_string(item_list_printer = ItemListPrinter)
    item_list_printer.to_string(all)
  end

  def to_summary(keys, item_list_printer = ItemListPrinter)
    item_list_printer.to_summary(all, keys)
  end

  def get(index)
    all[index]
  end

  private

  def found?(item)
    @items.include?(item)
  end

  def all
    @items
  end
end
