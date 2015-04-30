class Email

  @@emails = []

  attr_reader(:email_address, :type, :id)

  define_method(:initialize) do |attributes|
    @email_address = attributes.fetch(:email_address)
    @type = attributes.fetch(:type)
    @id = @@emails.length() + 1
  end

  define_method(:store) do
    @@emails.push(self)
  end

  define_singleton_method(:all) do
    @@emails
  end

  define_singleton_method(:find) do |identification|
    @@emails.each() do |email|
      if email.id().eql?(identification.to_i())
        return email
      end
    end
  end

  define_singleton_method(:clear) do
    @@emails = []
  end
end
