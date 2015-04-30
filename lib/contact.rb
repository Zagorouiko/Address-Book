class Contact
  #class variable

  attr_reader(:first_name, :last_name, :birthday)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @birthday = attributes.fetch(:birthday)
  end

  
end
