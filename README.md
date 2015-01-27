Employee and Project Tracker DB
================

by Grace Mekarski and Frank Meza

Employee and Project Tracker DB is a website that uses a database and Sinatra to allow a company to add divisions to their company, add employees to each division, and projects to each employee.

Installation
------------

Install Train System DB by first cloning the repository.  
```
$ git clone http://github.com/gracelauren/Company_Tracker.git
```

Install all of the required gems:
```
$ bundle install
```

Start the database:
```
$ postgres
```

Create the databases and tables by cd-ing into your Company_Tracker-master folder then in the terminal run the following:

```

```
$ rake db:create

```

```
$ rake db:schema:load

```

```
$ rake db:test:prepare
```

```
```

Start the webserver:
```
$ ruby app.rb
```

In your web browser, go to http://localhost:4567

License
-------

GNU GPL v2. Copyright 2015 Grace Mekarski and Frank Meza
