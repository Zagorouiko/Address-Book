require('rspec')
require('contact')
require('phone')
require('email')
require('address')

describe(Email) do

  before() do
    Email.clear()
  end

  describe('#email_address') do
    it('will return the email address of the email object') do
      test_email = Email.new({:email_address => "mcfadden.113@gmail.com",:type => "Home"})
      test_email.email_address()
      expect(test_email.email_address()).to(eq('mcfadden.113@gmail.com'))
    end
  end

  describe('#type') do
    it('will return the type of the email object') do
      test_email = Email.new({:email_address => "mcfadden.113@gmail.com",:type => "Home"})
      test_email.type()
      expect(test_email.type()).to(eq('Home'))
    end
  end

  describe('#store') do
    it('stores contact information') do
      test_email = Email.new({:email_address => "mcfadden.113@gmail.com",:type => "Home"})
      test_email.store()
      expect(Email.all()).to(eq([test_email]))
    end
  end

  describe('.find') do
    it("finds a contact based on it's id") do
      test_email1 = Email.new({:email_address => "mcfadden.113@gmail.com",:type => "Home"})
      test_email1.store()
      test_email2 = Email.new({:email_address => "mcfadden.143@gmail.com",:type => "Home"})
      test_email2.store()
      expect(Email.find(2)).to(eq(test_email2))
    end
  end

end
