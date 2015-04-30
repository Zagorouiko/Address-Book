class Contact

  @@contacts = []

  attr_reader(:first_name, :last_name, :birthday, :id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @birthday = attributes.fetch(:birthday)
    @id = @@contacts.length() + 1
    @phones = []
    @emails = []
    @addresses = []
  end

  define_method(:store) do
    @@contacts.push(self)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_singleton_method(:find) do |identification|
    @@contacts.each() do |contact|
      if contact.id().eql?(identification.to_i())
        return contact
      end
    end
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_method(:add_phone) do |phone|
    @phones.push(phone)
  end

  define_method(:add_email) do |email|
    @emails.push(email)
  end

  define_method(:add_address) do |address|
    @addresses.push(address)
  end

  define_method(:phones) do
    @phones
  end

  define_method(:emails) do
    @emails
  end

  define_method(:addresses) do
    @addresses
  end
end
