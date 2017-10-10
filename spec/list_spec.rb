require 'list'

RSpec.describe List do
  let(:item) { double(:item1) }
  let(:item_list_printer) { double(:item_list_printer) }

  let(:items) do
    [
      double(:item_1, name: 'Test Item 1',
                      description: 'Test item 1 description',
                      price: '10.95'),
      double(:item_2, name: 'Test Item 2',
                      description: 'Test item 2 description',
                      price: '5.99'),
      double(:item_3, name: 'Test Item 3',
                      description: 'Test item 3 description',
                      price: '2.50'),
      double(:item_4, name: 'Test Item 4',
                      description: 'Test item 4 description',
                      price: '12.00')
    ]
  end

  subject(:list_empty) { described_class.new }
  subject(:list_item_1) { described_class.new([items[0]]) }
  subject(:list_full) { described_class.new }


  context '#initialize' do
    it 'creates a list with no items' do
      expect(list_empty.get_by_index(0)).to be_nil
    end
  end

  context '#add' do
    it 'should add a item to items array' do
      expect { list_empty.add items[0] }
        .to change { list_empty.items }.by [items[0]]
    end

    context 'raise_error' do
      it 'should raise_error if item already in list' do
        expect { list_item_1.add(items[0]) }
          .to raise_error 'Already exists in list'
      end
    end
  end

  context '#remove' do
    it 'should remove a item from the items array' do
      list_item_1.remove(items[0])
      expect(list_item_1.items)
        .not_to include items[0]
    end

    context 'raise_error' do
      it 'should raise_error if item not found' do
        expect { list_empty.remove(items[0]) }
          .to raise_error 'Not found in list'
      end
    end
  end

  context '#find' do
    before(:each) do
      items.each do |item|
        list_full.add(item)
      end
    end

    it 'should find and return a list item' do
      expect(list_full.find(items[0])).to eq items[0]
    end
  end

  context '#get_by_index' do
    it 'gets item at index' do
      list_empty.add items[0]
      expect(list_empty.get_by_index(0)).to_not be_nil
    end
  end

  context '#to_string' do
    before(:each) do
      [items[0], items[1], items[2], items[3]].each do |item|
        list_full.add(item)
      end
    end
    context 'as a string' do
      it 'passes all items as printer and returns result' do
        other_items = [items[0], items[1], items[2], items[3]]
        expect(item_list_printer)
          .to receive(:to_string).with(other_items)
        list_full.to_string(item_list_printer)
      end
    end
  end

  context '#to_summary' do
    before(:each) do
      [items[0], items[1], items[2], items[3]].each do |item|
        list_full.add(item)
      end
    end
    context 'as a summary' do
      it 'passes all items as printer and returns summary result' do
        allow(item_list_printer)
          .to receive(:each).and_return('Test Item 1', '10.95')
        allow(item_list_printer)
          .to receive(:join).and_return('1. Test Item 1 10.95\n')

        other_items = [items[0], items[1], items[2], items[3]]
        expect(item_list_printer)
          .to receive(:to_summary).with(other_items, %i[name price])
        list_full.to_summary(%i[name price], item_list_printer)
      end
    end
  end
end
