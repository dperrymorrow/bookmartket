# Booksmartlet

A bookmarklet that holds an iframe of this rails build to let you store bookarks by tags and notes as well. 

- the views inside the iframe are backbone views.
- the database is postgres
- its hosted on heroku

# Running Locally

- cd into dir
- install needed gems

````bash
bundle install
````

- make sure you have postgres running

````bash
ps aux | grep postgres
````
- make sure your config/database.yml is correct for your development env
- create your database

````bash
rake db:create
rake db:migrate
rake db:seed
````
- start the rails app

````bash
rails s
````

- navigate to [http://localhost:3000](http://localhost:3000)




