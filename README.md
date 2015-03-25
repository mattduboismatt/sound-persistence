Reverb Exercise
http://reverb.com/page/dev-challenge

Instructions:
1) Run command line program and see user records printed to console

  $> sound_persistence

2) Run rackup server

  $> rackup config.ru

To make api requests to server, use following 6 templates:

#1a) Add new record with comma delimiter

  curl -i --data record="Jones, Mike, Male, Red, 1980-01-01" "localhost:9292/records"

#1b) Add new record with pipe delimeter

  curl -i --data record="Jones | Mike | Male | Red | 1980-01-01" "localhost:9292/records"

#1c) Add new record with space delimeter

  curl -i --data record="Jones Mike Male Red 1980-01-01" "localhost:9292/records"

#2a) Output 1 – sorted by gender, then last name ascending

  curl -i -H "Accept: application/json" "localhost:9292/records/gender"

#2b) Output 2 – sorted by birth date, ascending

  curl -i -H "Accept: application/json" "localhost:9292/records/birthdate"

#2b) Output 3 – sorted by last name, descending

  curl -i -H "Accept: application/json" "localhost:9292/records/name"