Dir['./models/*.rb'].each {|file| require file }
Dir['./views/*.rb'].each {|file| require file }
Dir['./controllers/*.rb'].each {|file| require file }
Dir['./helpers/*.rb'].each {|file| require file }