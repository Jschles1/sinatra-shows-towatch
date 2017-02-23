# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
  - Project includes User and Show models.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
  - User has_many Shows, Show belongs_to User
- [x] Include user accounts
  - Users are required to create and/or login to an account to use the app.
- [x] Ensure that users can't modify content created by other users
  - User's are rejected from editing and/or deleting shows of other users if they try to.
- [x] Include user input validations
  - Inputs are checked if they are valid, if not an error message is given (ex. form left blank, username already taken etc.).
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
  - Flash error messages are displayed if there is a failure.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
