require('rspec')
require('contact')
require('phone')

describe(Phone) do

  before() do
    Contact.clear()
  end

  describe('#number') do
    it("return the number of a phone object") do
      test_phone = Phone.new({:number => "5612544464", :type => "cell"})
      expect(test_phone.number()).to(eq("5612544464"))
    end
  end

  describe('#type') do
    it("return the number of a phone object") do
      test_phone = Phone.new({:number => "5612544464", :type => "cell"})
      expect(test_phone.type()).to(eq("cell"))
    end
  end

  describe('#store') do
    it('stores contact information') do
      test_phone = Contact.new({:number => "5612544464", :type => "cell"})
      test_phone.store()
      expect(Phone.all()).to(eq([test_phone]))
    end
  end

  describe('.find') do
    it("finds a contact based on it's id") do
      test_phone1 = Phone.new({:number => "5612544464", :type => "cell"})
      test_phone1.store()
      test_phone2 = Phone.new({:number => "5612544464", :type => "cell"})
      test_phone2.store()
      expect(Phone.find(2)).to(eq(test_contact2))
    end
  end
end
