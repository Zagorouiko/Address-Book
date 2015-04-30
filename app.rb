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

post('/clear_contact/:id') do
  @id = params.fetch('id').to_i()
  Contact.all().delete_at(@id - 1)
  erb(:index)
end

post('/add_phone/:id') do
end


  # contact_phone
  # contact_address
  # contact_email
