# imgrepochallenge

Challenge for the Shopify Backend Developer internship. This project is a basic image repository allowing users to publish their own images and include a title and relevant tags. Users can search for images via tags and titles and an experimental "similar image" feature that is akin to a more finicky reverse image search. 

## Dependencies

* ruby 2.6.3 or newer
* MySQL

## Installation

After downloading the project to your computer, navigate to the project folder and run the following command:

```shell
bundle
```

Next create the database using:

```shell
rails db:create
```

and

```shell
rails db:migrate
```

Finally start the localhost server with 

```shell
rails s
```
