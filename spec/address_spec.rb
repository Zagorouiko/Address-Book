require('rspec')
require('address')
require('phone')
require('email')
require('address')

describe(Address) do

  before() do
    Address.clear()
  end

  describe('#address') do
    it('will return the address of the address object') do
      test_address = Address.new({:address => "555 water st.", :city => "Portland", :state => "Oregon", :zip => "97227", :type => "Home"})
      test_address.address()
      expect(test_address.address()).to(eq('555 water st.'))
    end
  end

  describe('#city') do
    it('will return the city of the address object') do
      test_address = Address.new({:address => "555 water st.", :city => "Portland", :state => "Oregon", :zip => "97227", :type => "Home"})
      test_address.city()
      expect(test_address.city()).to(eq('Portland'))
    end
  end

  describe('#state') do
    it('will return the state of the address object') do
      test_address = Address.new({:address => "555 water st.", :city => "Portland", :state => "Oregon", :zip => "97227", :type => "Home"})
      test_address.state()
      expect(test_address.state()).to(eq('Oregon'))
    end
  end

  describe('#zip') do
    it('will return the type of the address object') do
      test_address = Address.new({:address => "555 water st.", :city => "Portland", :state => "Oregon", :zip => "97227", :type => "Home"})
      test_address.zip()
      expect(test_address.zip()).to(eq('97227'))
    end
  end

  describe('#type') do
    it('will return the type of the address object') do
      test_address = Address.new({:address => "555 water st.", :city => "Portland", :state => "Oregon", :zip => "97227", :type => "Home"})
      test_address.type()
      expect(test_address.type()).to(eq('Home'))
    end
  end

  describe('#store') do
    it('stores address information') do
      test_address = Address.new({:address => "555 water st.", :city => "Portland", :state => "Oregon", :zip => "97227", :type => "Home"})
      test_address.store()
      expect(Address.all()).to(eq([test_address]))
    end
  end

  describe('.find') do
    it("finds a address based on it's id") do
      test_address1 = Address.new({:address => "555 water st.", :city => "Portland", :state => "Oregon", :zip => "97227", :type => "Home"})
      test_address1.store()
      test_address2 = Address.new({:address => "578 water st.", :city => "Portland", :state => "Oregon", :zip => "97227", :type => "Home"})
      test_address2.store()
      expect(Address.find(2)).to(eq(test_address2))
    end
  end

end
