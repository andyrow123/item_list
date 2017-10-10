require './lib/item_list_printer'

RSpec.describe ItemListPrinter do
  context 'printing a list of items' do
    let(:item_printer_module) { double(:item_printer_module) }
    let(:items) { [double(:item1), double(:item2)] }

    it 'sends each item to the item_printer' do
      expect(item_printer_module)
          .to receive(:to_string).with(items[0], 1)
      expect(item_printer_module)
          .to receive(:to_string).with(items[1], 2)

      described_class.to_string(items, item_printer_module)
    end

    it 'separates item_printer output onto separate lines' do
      allow(item_printer_module).to receive(:to_string).and_return('a item')

      expect(described_class.to_string(items, item_printer_module)).to eq("a item\na item")
    end
  end

  context 'printing a summary of items' do
    let(:item_printer_module_summary) { double(:item_printer_module_summary) }
    let(:items) { [double(:item1), double(:item2)] }

    it 'sends each item to the item_printer' do
      expect(item_printer_module_summary).to receive(:to_summary).with(items[0], [:name, :price], 1)
      expect(item_printer_module_summary).to receive(:to_summary).with(items[1], [:name, :price], 2)

      described_class.to_summary(items, [:name, :price], item_printer_module_summary)
    end

    it 'separates item_printer output onto separate lines' do
      items.each {|item|
        allow(item).to receive(:[]).and_return('a item')
      }

      allow(item_printer_module_summary).to receive(:to_summary).and_return('a item')

      expect(described_class.to_summary(items, [:name, :price], item_printer_module_summary)).to eq("a item\na item")
    end
  end
end
