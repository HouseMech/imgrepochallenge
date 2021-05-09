# imgrepochallenge

Challenge for the Shopify Backend Developer internship. This project is a basic image repository allowing users to publish their own images and include a title and relevant tags. Users can search for images via tags and titles and an experimental "similar image" feature that is akin to a more finicky reverse image search. 

## Dependencies

* ruby 2.6.3 or newer
* MySQL

## Installation

After downloading the project to your computer, navigate to the project folder and run the bundler


```shell
$ cd imgrepochallenge
$ bundle
```

Next you will need to setup database.yml. You can use config/database.yml.sample as a base. Fill in the password field with your appropriate database credentials.

```shell
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: <insert password here>
  host: localhost
```

Afterwards, in your terminal, run:

```shell
$ rails db:create
```

and

```shell
$ rails db:migrate
```

Finally start the localhost server with 

```shell
$ rails s
```
