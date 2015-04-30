class Phone

  @@phonebook = []

  attr_reader(:number, :type)

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)
    @id = @@phone.length() + 1
  end

  define_method(:store) do
    @@phonebook.push(self)
  end

  define_singleton_method(:all) do
    @@phonebook
  end

  define_singleton_method(:find) do |identification|
    @@phonebook.each() do |phone|
      if phone.id().eql?(identification.to_i())
        return phone
      end
    end
  end

  define_singleton_method(:clear) do
    @@phonebook = []
  end
end
