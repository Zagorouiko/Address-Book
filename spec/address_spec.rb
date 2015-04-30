require('rspec')
require('contact')

describe(Contact) do

  describe('#first_name') do
    it('will return the first name of the contact') do
      test_contact = Contact.new({:first_name => "Leon",:last_name => "Zagorouiko",:birthday => "05/15/89"})
      test_contact.first_name()
      expect(test_contact.first_name()).to(eq('Leon'))
    end
  end




  describe('#store') do
    it('stores contact information') do
      test_contact = Contact.new({:first_name => "Leon",:last_name => "Zagorouiko",:birthday => "05/15/89"})
      test_contact.store()
      expect(Contact.all()).to(eq([]))
    end
  end


end
