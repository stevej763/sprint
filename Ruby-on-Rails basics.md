# Ruby-on-Rails basics:

## Routing:

- A route needs three things, a controller, and action and a view
- Routing is done with a DSL (domain speicifc language)
- Example: `get "/articles", to: articles#index` (when going to the /articles endpoint, run the index action (method) from the articles controller)

## Building a controller

Rails comes with a lot of scipts that do the heavy lifting for you. To build a controller simply run the following command:

```
bin/rails generate controller Articles index --skip-routes
```

This generates a number of files:

- Articles controller (articles_controller.rb) with an `index` method
- An `index.html.erb` view file (automatially linked to the `index` method in the controller)
- Some test and test helper files
- a scss tempalte file (Sassy Cascading Style Sheets) that gets complied into CSS for your view

Now if you start up the server and go the the `/articles` route it will call on the `articles_controller` `index` method which displays the `index.html.erb` file

## Homepage

- Adding a homepage is as simple as adding a `root` to your route folder:
  Eg

```
root "articles#index"
```

Now whenever you start your app rails will return the view linked with the index method of your article endpoint

## useful commands

- `bin/rails routes` -> Displays all active routes on your server
- `bin/rails db:migrate` -> Runs all your db migrations
- `bin/rails generate model <model_name> ..<propertys>` -> Generates a model for your application, add as many properties as you want `name:type`
- `bin/rails generate controller <controller_name> ..<endpoints> ` -> Generates a controller for your application, with the endpoints you want on it - add `--skip-routes` if you want to manage the endpoints in the `routes.rb` file

## Models

You can have Rails auto generate a model structure for you by using the CLI:

```
$ bin/rails generate model Article title:string body:text
```

This generates an Article model with a `title` and `body` property
All models extend the `ActiveRecord` class which includes lots of super helpful methods that abstract all the generlly used methods out.

It also generates a number of files:

- a db migration file: `<timestamp>_create_articles.rb`
- a model file `article.rb`
- a tempalte test `article_spec` file

The migration file contains an automatically created method that will create a table in your database with the plural of your model as the name article -> `articles` as well as columns to match the model properties

It will also add some default timestamp columns: `created_at` and `updated_at`. Super useful!

To add this model to your DB run the inbuilt rails command:

```
bin/rails db:migrate
```

## How to use a model in rails

(More detail here: [Active Record basics](https://guides.rubyonrails.org/active_record_basics.html))

## Creating and persisting objects

There are loads of really useful default methods that come with any models (Classes that extend `ActiveRecord`)
`Model.new` as you would expect, this creates a new instance of your object from your model template, using our article example it might look like:

(read this to learn everything: [Active Record basics](https://guides.rubyonrails.org/active_record_basics.html))

```
article = Article.new(title: "This is my title", body: "This is my body)
```

This initalised a new article but only in memory, to save it there is a default .save method

```
article.save
```

You can also just directly create the object and save it to the database by using the `.create` method:

```
Article.create(title: "This is my title", body: "This is my title)
```

## Reading from the DB

(again, read this: [Active Record basics](https://guides.rubyonrails.org/active_record_basics.html))

Get all of a given model from the db:

```
Article.all
```

Get the first one:

```
Article.first
```

Query the db for perticular properties:

```
Article.where(category: 'Horror').order(created_at: :desc) - finds any articles with the category of `Horror` then order them descending.
```

## Updating

Just read the examples here: [Active Record basics](https://guides.rubyonrails.org/active_record_basics.html)

## Deleting

Just read the examples here: [Active Record basics](https://guides.rubyonrails.org/active_record_basics.html)

## Add all CRUD methods to an endpoint by default:

use the `resources` method to the controller to apply GET POST PUT and DELETE

```
resources :articles
```

## Frontend view helper methods:

If you want your page to have access to a list of things from the database:

```
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
end
```

Now your `articles.html.erb` file will be able to access a list of articles which you would display with something like:

```
 <% @articles.each do |article| %>
    <li>
      <%= article.title %>
    </li>
  <% end %>
```

You can also use a few path helper methods: eg you want to link to a post you can use:

```
 <a href="<%= article_path(article) %>">
```

Or remove the `<a>` tag entirely and use

```
<%= link_to article.title, article %>
```

## Partials

You can create partials using the render method:

add a new folder `views/shared`

In here you can create templates that multiple `erb` files can use

partials must start with an `_`

eg if you have a navbar that you want on every page:

```
<nav >my navbar code </nav>
```

saved in a file called `_nav`

now another page can use this template by adding in:

```
<%= render "shared/_nav" %>
```
