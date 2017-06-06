# Sublease

* Visitors can see a list of apartments or houses ready for sublease
* Can log in as renter or host
* Host can publish short-term sublease in a specific area (say Hyde park)
* A house for rent include 
  * Location
  * Time to rent
  * Rate
  * Number of rooms
  * Pictures
  * Host contact information
* Renters can make a reservation with the host, this will change the house's status to reserved.
* Renters can leave a message with the host.
* Users can see their past event, the information of the house they reserved or they published.
* Administrators can add, edit and delete users.
* Administrators can edit and delete houses.
* And maybe more features in the future.


# Week 8

* Add bootstrap to stylesheet
* Implement user sign up and sign in functions.  ( in "/users/new" & "sign in" )
* Users can sign up as a renter or a host. 
* Hosr can publish a new house for lease (in "/house/new" (Only valid when a host sign in))
* A simple list of houses to rent in root
* a simple show house page

### Edit

* In user/show, can edit the phone number directly.
* Host can edit the house information he post.
* Renter can click the reserve button to reserve the house.
* Can see the reservation details in the detail page, and the renter can choose to cancel it.
* Renters can leave message to the house (under construction).


## Week 10

#### ADMIN

* Log in as 'admin' and password 'admin'
* Can see statistics about users and houses.
* Can add, delete, modify the houses and reservations
* Can check the list of reservations

#### HOST

* update: when a user finished perchase a house, host will get the credits in account
* after renter reserve a house, host can decide to reject the reservation or confirm. After confirm, renter can purchase the reservation.

#### HOUSE

* update: Has a new feature availability. 1 - new house availible, 0 - reserved house for some renter, -1 - confirmed by host, -2 purchased.
* The house with 'availability' lower than 0 will not be shown in the index page of Houses. 

#### USER

* register validation, register must use email, and cannot have required field blank, and has a well formatted message
* renter can see the house he reserved and click pay to pay for the house.
* host can see all his house and provide link to the renter so he can check his profile. 

#### PAYMENT

* A new controller payment, using `gem 'stripe'`
* In renter's profile page you can click on the pay link to open a payment
* I write a javascript in application.js to get the token using stripe's api
* post the token string to methon create of payment controller, and submit the stripe request to pay the amount of money
* In test mode, you can test the payment using card 4242424242424242 with any name, cvc, any date after current date.
* I think this feature is similar to the `Feature Elective` in default project

### For test

You can click sign in and sign up to sign as renter.
Click a house and click reserve to reserve it.
In your profile page you can see all the reservations you have.
You can check other user's profile, reservation record, but you cannot edit the information (like phone number) or cancel a reservation that not belongs to you.

You can reserve a house and log in to
* username: zhengyangc@uchicago.edu
* password: qwerty
(which hold most of houses in seed data)
So you can confirm the reservation or discard it.