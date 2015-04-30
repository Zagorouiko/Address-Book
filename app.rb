require 'sinatra'
require 'sinatra/reloader'
require './lib/contact'
require './lib/address'
require './lib/email'
require './lib/phone'
also_reload './lib/*/**.rb'
require 'pry'

get('/') do
  erb (:index)
end

get('/add_new_contact') do
  erb(:new_contact)
end

post('/add_a_new_contact') do
  new_contact = Contact.new({:first_name => params.fetch('first_name'), :last_name => params.fetch('last_name'), :birthday => params.fetch('birthday')})
  new_contact.store()
  @contacts = Contact.all()
  erb(:all_contacts)
end

get('/contact/:id') do
  @id = params.fetch('id')
  contacts = Contact.all()
  @contact = Contact.find(@id.to_i())
  erb(:contact)
end

# post('/clear_contact/:id') do
#   @id = params.fetch('id').to_i()
#   Contact.all().delete_at(@id - 1)
#   erb(:index)
# end

get('/add_phone/:id') do
  @id = params.fetch('id').to_i()
  erb(:add_phone)
end

get('/add_email/:id') do
  @id = params.fetch('id').to_i()
  erb(:add_email)
end

get('/add_address/:id') do
  @id = params.fetch('id').to_i()
  erb(:add_address)
end

post('/phone_added/:id') do
  @id = params.fetch('id').to_i()
  new_phone = Phone.new({:number => params.fetch('phone_number'), :type => params.fetch('type')})
  new_phone.store()
  @contact = Contact.find(@id)
  @contact.add_phone(new_phone)
  # @all_phones = Phone.all()
  @contacts = Contact.all()
  erb(:all_contacts)
end

post('/email_added/:id') do
  @id = params.fetch('id').to_i()
  new_email = Email.new({:email_address => params.fetch('email'), :type => params.fetch('type')})
  new_email.store()
  @contact = Contact.find(@id)
  @contact.add_email(new_email)
  # @all_phones = Phone.all()
  @contacts = Contact.all()
  erb(:all_contacts)
end

post('/address_added/:id') do
  @id = params.fetch('id').to_i()
  new_address = Address.new({:address => params.fetch('address'), :city => params.fetch('city'), :state => params.fetch('state'), :zip => params.fetch('zip'), :type => params.fetch('type')})
  new_address.store()
  @contact = Contact.find(@id)
  @contact.add_address(new_address)
  # @all_phones = Phone.all()
  @contacts = Contact.all()
  erb(:all_contacts)
end

get ('/full_contact/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact_full)
end

get('/all_contacts') do
  @contacts = Contact.all()
  erb(:all_contacts)
end
