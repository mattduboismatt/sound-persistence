# run script to write records into 3 lib/ files
require 'faker'
require 'pry'

RECORDS_PER_FILE = 20

GENDERS = ["Male","Female"]

def make_record(delimiter)
  record = ""
  last_name = Faker::Name.last_name
  first_name = Faker::Name.first_name
  gender = GENDERS.sample
  favorite_color = Faker::Commerce.color
  date_of_birth = Faker::Date.backward(100*365)
  record << last_name+delimiter
  record << first_name+delimiter
  record << gender+delimiter
  record << favorite_color.capitalize+delimiter
  record << date_of_birth.to_s+"\n"
  record
end

def make_doc(delimiter)
  doc = ""
  RECORDS_PER_FILE.times do
    record = make_record(delimiter)
    doc << record
  end
  doc
end

File.open('lib/comma.txt', 'w+') {|file| file.write(make_doc(", "))}
File.open('lib/pipe.txt', 'w+') {|file| file.write(make_doc(" | "))}
File.open('lib/space.txt', 'w+') {|file| file.write(make_doc(" "))}