<div align="center">

 

# Tea Leaf
  
![Screen Shot 2022-01-12 at 9 40 47 AM](https://user-images.githubusercontent.com/76824096/149183202-94311648-bcda-4dee-a2a5-c23deb7009db.png)

[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]

## Overview

Tea leaf is a JSON API 1.0 spec-compliant REST API built in Rails with endpoints for users to subscribe a customer to a tea subscription, cancel a customer's tea subscription, and to see all of a customer's tea subscriptions (including active and cancelled). In addition, users can create customers and create teas. for purposes of exposing and consuming.
</div>

<div align="center">

  ## Contributors

### Dane Brophy

[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://github.com/danembb)
[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/dane-brophy/)

### Schema Design
  
  ![Screen Shot 2022-01-12 at 5 40 05 AM](https://user-images.githubusercontent.com/76824096/149181980-119b9ebd-6073-416c-bf2e-866e4d7b91ff.png)
  
## Tools Used

|Development|Development|Testing
|--- |--- |--- |
|[<img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />](https://www.ruby-lang.org/en/downloads/)|[<img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)|[ <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/rspec/rspec-rails)
|[ <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />](https://rubygems.org/gems/rails/versions/5.2.6)|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://desktop.github.com/)|[<img src="https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/teamcapybara/capybara)
|[<img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/pry/versions/0.10.3)|[<img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />](https://atom.io/)|[<img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/bblimke/webmock)
|[<img src="https://img.shields.io/badge/sql-postgreSQL-green"/>](https://www.postgresql.org/)||[<img src="https://img.shields.io/badge/-VCR-lightgrey"/>](https://github.com/vcr/vcr)
|[<img src="https://img.shields.io/badge/-Postico-yellowgreen"/>](https://eggerapps.at/postico/)||[<img src="https://img.shields.io/badge/launchy-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/launchy/versions/2.4.3)
|[<img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />](https://www.postman.com/product/rest-client/)||[<img src="https://img.shields.io/badge/-FactoryBot-green"/>](https://github.com/thoughtbot/factory_bot)
|[<img src="https://img.shields.io/badge/-Figaro-yellow"/>](https://github.com/laserlemon/figaro)||[<img src="https://img.shields.io/badge/-Faker-blue"/>](https://github.com/faker-ruby/faker)
|[<img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/lostisland/faraday)||[<img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/simplecov/versions/0.12.0)|


</div>

<div align="center">

## Setup

</div>

This project requires Ruby 2.7.2.

 * Fork and clone this repository
 * Change into the `tea_leaf` directory
 * From the command line, install gems and set up your DB:
     * `bundle install && bundle update`
     * `rails db:{create,migrate,seed}`
 * Run the test suite with `bundle exec rspec -fd`
<br>
<div align="center">
  
### Project Configurations
</div>

  * Ruby version
      ```bash
      $ ruby -v
      ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
      ```

  * [System dependencies](https://github.com/danembb/tea_leaf/blob/main/Gemfile)
      ```bash
      $ rails -v
      Rails 5.2.6
      ```

  * Database creation
      ```bash
      $ rails db:{drop,create,migrate,seed}
      Created database 'tea_leaf_development'
      Created database 'tea_leaf_test'
      ```

      ```bash
      $ bundle install
      ```

  * How to run the test suite
      ```bash
      $ bundle exec rspec -fd
      ```
<div align="center">
  
## Endpoints
</div>

For a more responsive and enteractive response installing/using [Postman](https://www.postman.com/) will enhance the experience. For accessing these end points provided you will have to run `rails server` or `rails s` to spin up your localhost url. Then utilizing the base path of `http://localhost:3000/` the end points get supplied at the end of this url and can get the response that the front end desires depending on the type of call.

#### Create a Subscription
- Request: `POST /api/v1/customers/:customer_id/subscriptions`
 
- Response: 
```ruby
{
    "data": {
        "id": "4",
        "type": "subscriptions",
        "attributes": {
            "customer_id": 1,
            "tea_id": 1,
            "title": "run with rooibos part 2",
            "price": 65.0,
            "frequency": "bimonthly",
            "status": "active"
        }
    }
}

```

#### Update a Subscription (Cancellation)
- Request: `PATCH /api/v1/customers/:customer_id/subscriptions/:subscription_id`

- Response:
```ruby
{
    "data": {
        "customer_id": 1,
        "tea_id": 1,
        "title": "green tea guru",
        "price": 40.0,
        "frequency": "monthly",
        "status": "cancelled"
    }
}
```

#### See a Customer's Subscriptions (Active & Cancelled)
- Request: `GET /api/v1/customers/:customer_id/subscriptions`

- Response:
```ruby
{
    "data": [
        {
            "id": "1",
            "type": "subscriptions",
            "attributes": {
                "customer_id": 1,
                "tea_id": 1,
                "title": "green tea guru",
                "price": 40.0,
                "frequency": "monthly",
                "status": "cancelled"
            }
        },
        {
            "id": "2",
            "type": "subscriptions",
            "attributes": {
                "customer_id": 1,
                "tea_id": 1,
                "title": "run with rooibos",
                "price": 65.0,
                "frequency": "bimonthly",
                "status": "active"
            }
        },
        {
            "id": "4",
            "type": "subscriptions",
            "attributes": {
                "customer_id": 1,
                "tea_id": 1,
                "title": "run with rooibos part 2",
                "price": 65.0,
                "frequency": "bimonthly",
                "status": "active"
            }
        }
    ]
}
```

#### Create a Customer
- Request: `POST /api/v1/customers`

- Response:
```ruby
{
    "data": {
        "id": 2,
        "first_name": "dane",
        "last_name": "brophy",
        "email": "dbrophy@cats.biz",
        "address": "101 Generic Drive, Ware, CO"
    }
}
```

#### Create a Tea
- Request: `POST /api/v1/teas`

- Response:
```ruby
{
    "data": {
        "id": 2,
        "name": "green tea",
        "image": "www.pixiv.com/wowgreentea",
        "description": "a greenish hue and lovely scent",
        "keywords": "earthy, calming",
        "origin": "?",
        "brew_time": 3,
        "temperature": 92.2
    }
}
```

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/danembb/tea_leaf.svg?style=flat-square
[contributors-url]: https://github.com/danembb/tea_leaf/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/danembb/tea_leaf.svg?style=flat-square
[forks-url]: https://github.com/danembb/tea_leaf/network/members
[stars-shield]: https://img.shields.io/github/stars/danembb/tea_leaf.svg?style=flat-square
[stars-url]: https://github.com/danembb/tea_leaf/stargazers
[issues-shield]: https://img.shields.io/github/issues/danembb/tea_leaf.svg?style=flat-square
[issues-url]: https://github.com/danembb/tea_leaf/issues
[build-badge]: https://img.shields.io/circleci/build/github/danembb/tea_leaf?style=flat-square
