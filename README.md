## MakersBnB

Week 6 Group Project

### Project Specification

Create a web application named MakersBnB that allows signed-up users to list and hire available spaces, (an "Airbnb clone").

### Technologies

Written in Ruby and Sinatra
Teamwork: Agile, standups, retros

Initial Goal
Create Minimum Viable Product by Tuesday night

### Headline specifications

[x] Any signed-up user can list a new space.
[x] Users can list multiple spaces.
[x] Users should be able to name their space, provide a short description of the space, and a price per night.


Users should be able to offer a range of dates where their space is available.

Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.

Nights for which a space has already been booked should not be available for users to book that space.

Until a user has confirmed a booking request, that space can still be booked for that night.

### User Stories

```
As a User
So I can use MakersBnB
I need to sign up as a user

As a User
So I can make a space available for hire
I want to be able to list my available space

As a User
So I can make multiple spaces available for hire
I want to be able to list more than one space

As a User
So I can tell spaces apart
I want each space to have a name

As a User
So other users can learn more about the space
I want each space to have a short description

As a User
So other users know how much it will cost to hire
I want each space to have a price per night

As a User
So other users know whether a space is available
I want each space to show it's availability

As a User
So I can control when a space is available or not
I want to be able to change availability depending on date
```

### MVP

A place can be added to a list/database.
The place can be hired (made unavailable).


#### Monday Afternoon

Float - Ryan
Paul & Ilja
Model/Database
- Ruby, postgreSQL

- setting up (development and test) databases (id, name)
- DatabaseConnection class
- Space class
  - .all
  - .create
  - hire

Dillon & Matteo
Views/Controller
- Ruby, Sintatra

- setting up development environment
- diagram route for web app (adhering to RESTful design principles)
- home/landing page for MakersBnB
- index page for Spaces list (display name)
- create (add) Space page
- add a Hire button
