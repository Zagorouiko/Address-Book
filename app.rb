require 'sinatra'
require 'sinatra/reloader'
require './lib/contact'
require './lib/address'
require './lib/email'
require './lib/phone'
also_reload './lib/*/**.rb'

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
