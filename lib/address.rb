class Address

  @@addresses = []

  attr_reader(:address, :city, :state, :zip, :type, :id)

  define_method(:initialize) do |attributes|
    @address = attributes.fetch(:address)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @type = attributes.fetch(:type)
    @id = @@addresses.length() + 1
  end

  define_method(:store) do
    @@addresses.push(self)
  end

  define_singleton_method(:all) do
    @@addresses
  end

  define_singleton_method(:find) do |identification|
    @@addresses.each() do |address|
      if address.id().eql?(identification.to_i())
        return address
      end
    end
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end
end
