require './class/author'
require './class/item'

describe 'Testing author class implementation' do
  before(:each) do
    @author = Author.new('John', 'Omachi')
    @item = Item.new
    @author.add_item(@item)
  end

  it 'Returns the first name of the instance' do
    expect(@author.first_name).to eql 'John'
  end

  it 'Returns the instance of class' do
    expect(@author).to be_instance_of Author
  end

  it 'Return the item array length ' do
    expect(@author.items.length).to be > 0
  end
end
