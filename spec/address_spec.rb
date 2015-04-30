require('rspec')
require('contact')

describe(Contact) do

  before() do
    Contact.clear()
  end

  describe('#first_name') do
    it('will return the first name of the contact') do
      test_contact = Contact.new({:first_name => "Leon",:last_name => "Zagorouiko",:birthday => "05/15/89"})
      test_contact.first_name()
      expect(test_contact.first_name()).to(eq('Leon'))
    end
  end

  describe('#last_name') do
    it('will return the last name of the contact') do
      test_contact = Contact.new({:first_name => "Leon",:last_name => "Zagorouiko",:birthday => "05/15/89"})
      test_contact.last_name()
      expect(test_contact.last_name()).to(eq('Zagorouiko'))
    end
  end

  describe('#birthday') do
    it('will return the birthday of the contact') do
      test_contact = Contact.new({:first_name => "Leon",:last_name => "Zagorouiko",:birthday => "05/15/89"})
      test_contact.birthday()
      expect(test_contact.birthday()).to(eq("05/15/89"))
    end
  end

  describe('#store') do
    it('stores contact information') do
      test_contact = Contact.new({:first_name => "Leon",:last_name => "Zagorouiko",:birthday => "05/15/89"})
      test_contact.store()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('.find') do
    it("finds a contact based on it's id") do
      test_contact1 = Contact.new({:first_name => "Leon",:last_name => "Zagorouiko",:birthday => "05/15/89"})
      test_contact1.store()
      test_contact2 = Contact.new({:first_name => "Adam",:last_name => "McFadden",:birthday => "02/08/91"})
      test_contact2.store()
      expect(Contact.find(2)).to(eq(test_contact2))
    end
  end
end
