#BookMark Manager

## User Stories
```
As a user
So that I can quickly go to web sites I regularly visit
I'd like to see a list of bookmarks
```

```
As a User
So I can save all the websites I visited most
I want to add a bookmark to a Bookmark Manager
```

```
As a user
So I can remove my bookmark from Bookmark Manager
I want to delete a bookmark
```

```
As a user
So I can change a bookmark in Bookmark Manager
I want to update a bookmark
```
## How to use and set up with DB

### DataBase
```
1- Connect to psql
2- Create the database using the psql command CREATE DATABASE bookmark_manager and bookmark_manager_test ;
3- Connect to the databases using the pqsl command \c bookmark_manager;
4- Run the query we have saved in the file db/migration/ in each DataBase
```
### Set up

```
- Just run 'bundle install' to install all de dependency.
```

### Run the app
```
- Run from your terminal ruby app.rb or rackup app.rb
```
### Run the test

```
- Run rspec from your terminal
```
