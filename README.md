## MakersBnB

Week 6 Group Project utilising AGILE project management

### Team Members

Dillon, Ilja, Matteo, Paul and Ryan

### Project Specification

Create a web application named MakersBnB that allows users to list and hire available spaces.

### Technologies

<<<<<<< HEAD
- Written in Ruby 
- Sinatra for handling requests and responses
=======
- Written in Ruby
- Sinatra and Rack for handling requests and responses
>>>>>>> 14179076c3165c459b339747c8bccdced0cfbe95
- Capybara for featuring testing
- RSpec for unit testing
- PostgreSQL for the databases
- Ruby Gemfile ```pg``` for connecting and executing SQL on PostgreSQL databases
- Ruby Gemfile ```rubocop``` for code analysis and formatting

### Headline specifications

- [x] Any signed-up user can list a new space.
- [x] Users can list multiple spaces.
- [x] Users should be able to name their space, provide a short description of the space, and a price per night.
- []Users should be able to offer a range of dates where their space is available.
- []Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- []Nights for which a space has already been booked should not be available for users to book that space.
- []Until a user has confirmed a booking request, that space can still be booked for that night.

### User Stories

```
As a User
So I can see what spaces are available for hire
I want to see a list of available spaces

As a User
So I can make a space available for hire
I want to be able to add my space to the list of available spaces

As a User
So I can make multiple spaces available for hire
I want to be able to add more than one space to the list of available spaces

As a User
So I and other users can tell spaces apart
I want each space to have a name

As a User
So other users can learn more about the space
I want each space to have a short description

As a User
So other users know how much it will cost to hire
I want each space to have a price per night

As a User
So I can use MakersBnB
I need to sign up as a user

As a User
So other users know whether a space is available
I want each space to show it's availability

As a User
So I can control when a space is available or not
I want to be able to change availability depending on date
```


### Initial Planning

#### Initial Goal
Create Minimum Viable Product by end of day 2.

#### MVP
A webpage that lists spaces available for hire.
A place can be added to a list via the website.
The place can be hired (made unavailable) via the website.


#### Plan for Day 1 Afternoon Work

**Model/Database - Paul & Ilja**

- [x] setting up (development and test) databases (id, name)
- [x] DatabaseConnection class
- Space class
  - .all
  - .create
  - hire

**Views/Controller - Dillon & Matteo**

- [x] setting up development environment
- [] diagram route for web app (adhering to RESTful design principles)
- [x] home/landing page for MakersBnB
- [x] index page for Spaces list (display name)
- create (add) Space page
- add a Hire button

<<<<<<< HEAD
**Float - Ryan**
=======
Float - Ryan

#### Setup Database
Connect to postgres, then create database:
```` psql postgres;
    CREATE DATABASE makersbnb;
    ````
connect to database using command ````\c makersbnb;
````
For test database: connect to postgres, then create database:
```` psql postgres;
    CREATE DATABASE makersbnb_test;
    ````
Connect to database using command ````\c makersbnb_test;
    ````
Run all the queries detailed in the migrations directory.
>>>>>>> 14179076c3165c459b339747c8bccdced0cfbe95
