# Sinatra TV Show Watchlist

This simple app will allow you to create a list of all your favorite TV shows, with their weekdays, times, and networks, that you can keep track of on one page for your convenience.

You can also edit and/or delete shows from your list at your choosing.

## Installation
First, clone the repository, then execute:
```
$ bundle install
```

## Usage
Clean then migrate the database:
```
$ rake db:reset db:migrate
```
To start the server, run:
```
$ shotgun
```
Then navigate to the your computer's given local address.

Finally, click on "Create Account" to create a user account and begin using the app.

## License

This Web Application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
