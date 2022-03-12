# MAIL DIGEST
#### Video Demo: insert URL
#### Description
##### TL;DR

One of the things I was missing are ['RSS'](https://en.wikipedia.org/wiki/RSS) readers, so I decided to create a small web application that lets a user to create as many news digests as he wants that get delivered by email every day - hence the name, `Mail Digest`.
The digests consume the chosen RSS feeds and get updated only if something new has been published.
The digest can be read online by accessing the user's personal area. Before this, a user needs to register and verify the email. Once this process is completed, the user can access the personal area and start creating new digests.

##### Tech stack

The application is Ruby on Rails based - `Rails 6.1.3` and `Ruby 3.0.0` - with a `Postgresql` database and running in `Docker` containers.
It currently runs smoothly in development mode, but still needs some work to be ready for production mode such as simpler way to be configured and a nicer UI.

By default `Rails` is not sending emails while in development mode, but their structure can be clearly seen in the logs.
The frontend is standard HTML/CSS with bits of StimulusJS.

The RSS feed update is managed by background jobs running on `Sidekiq` and `Redis`. Multiple feeds can be added to the personal digest (there's no limit). At each save, a background job - so to speak a piece of code executed on the server which is not blocking the UI - is enqueued into the `Redis` database. `Sidekiq` then loads the Rails environment and executes the code, updating the database with the latest articles for tha feed.  Once this is done, an email with the new content is sent to the user.  

Login and authentication are managed using `Devise`, a popular Rails `engine` that has all the necessary feature such as: registration, password changes, forgotten passwords, token checks etc.

##### Running in development mode

Before starting set up some environment variables:
```bash
export PORT=3000
export POSTGRES_USER=root
export REDIS_URL=redis://redis:6379/0
export uid=$(id -u)
export gid=$(id -g)
```
the last two are important if you're using a Linux based computer without being the administrator. It will create a user with the same user ID and group ID of the one you're using in the Docker container, preventing `root`, which is the default one, to take ownership of your project folder when mounted into the container.
This happens because on Linux, Docker runs as a daemon which is not the case on MacOS or Windows.

* Build the containers `docker-compose build dev`
* Run the containers `docker-compose up dev`
* Create the database `docker-compose run --rm dev bin/rails db:create`
* Run the migrations `docker-compose run --rm dev bin/rails db:migrate`

After these steps you should be good to go and ready to access the application at ['localhost:3000'](http://localhost:3000)

##### Running in production mode

Still a WIP but fundamentally the steps are almost the same ones used for development mode.
Before going to production I also need to write tests which are currently missing - Sorry about that :) 
