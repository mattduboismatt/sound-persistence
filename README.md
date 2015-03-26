###Reverb Exercise
http://reverb.com/page/dev-challenge

####Instructions:

#####To run program from command line with user records printed to console:

> sound_persistence

#####To run rackup server to access API:

> rackup config.ru

#####To make API requests to server, use following 6 templates:

* Add new record with comma delimiter

> curl -i --data record="Jones, Mike, Male, Red, 1980-01-01" "localhost:9292/records"

* Add new record with pipe delimeter

> curl -i --data record="Jones | Mike | Male | Red | 1980-01-01" "localhost:9292/records"

* Add new record with space delimeter

> curl -i --data record="Jones Mike Male Red 1980-01-01" "localhost:9292/records"

* Output 1 – sorted by gender, then last name ascending

> curl -i -H "Accept: application/json" "localhost:9292/records/gender"

* Output 2 – sorted by birth date, ascending

> curl -i -H "Accept: application/json" "localhost:9292/records/birthdate"

* Output 3 – sorted by last name, descending

> curl -i -H "Accept: application/json" "localhost:9292/records/name"