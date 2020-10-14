# Viewing Party
![](https://img.shields.io/badge/Rails-5.2.4.3-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)    ![](https://img.shields.io/badge/Ruby-2.5.3-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)  ![](https://img.shields.io/badge/Code-HTML-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=1e90ff) ![](https://img.shields.io/badge/Code-CSS-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=1e90ff) 
[![Build Status](https://travis-ci.com/hashmaster3k/viewing_party.svg?branch=main)](https://travis-ci.com/hashmaster3k/viewing_party) ![Badge](https://marcgrimme.github.io/simplecov-small-badge/badges/coverage_badge_total.svg)



This project was created as a project for the Turing School of Software & Design. The purpose is to build foundational knowledge of API consumption, implementing WebMock and VCR for API testing, utilizing the facade and service design patterns, build self-referential relationship, and deploy continuous integration for the web app. We will also strengthen knowledge of TDD, perform refactoring, and stylize the web pages.

This project was completed by [Hash G](https://github.com/hashmaster3k) and [Nico R](https://github.com/nicorithner)

To see a live version click here ->
https://dry-tor-99046.herokuapp.com/

## Summary

  - [Getting Started](#getting-started)
  - [Setting Up API](#setting-up-api)
  - [Testing](#running-tests)
  - [Deployment](#deployment)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

This project was built using ruby version 2.5.3 and rails 5.2.4.3. Ensure that you either install these versions or change the versions in the Gemfile.

### Prerequisites

This project uses postgresql for database management. Please download the [Postgres.app](https://postgresapp.com/downloads.html) and follow the documentation to also install the CLI tools.

In addition to the standard rails gems, we used the following gems:
```rspec```, ```capybara```, ```simplecov```, ```pry```, ```shoulda-matchers```, ```webmock```, ```vcr```, ```faraday```, ```figaro```, ```bcrypt```, and ```rubocop```.

- [RSpec](https://github.com/rspec/rspec-rails) - Test Suite
- [Capybara](https://github.com/teamcapybara/capybara) - Additional Testing Tools
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) - Test Coverage
- [Pry](https://github.com/pry/pry) - Runtime Dev Console
- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) - Additional Testing Tools
- [WebMock](https://github.com/bblimke/webmock) - API Testing Tool
- [VCR](https://github.com/vcr/vcr) - Additional API Testing Tool
- [Faraday](https://github.com/lostisland/faraday) - API Consumption
- [Figaro](https://github.com/laserlemon/figaro) - API Key Protection
- [BCrypt](https://github.com/codahale/bcrypt-ruby) - Password Protection for Authentication
- [RuboCop](https://github.com/rubocop-hq/rubocop) - Linter (optional)

Please follow the documentation for each gem for proper installation and functionality. Note: Most needed files/code are already added (rails_helper, spec_helper, etc.)

### Installing

If you plan on making your own changes and intend to push it back up, fork this repository then clone it into your directory of choice. In the main project directory, delete the file Gemfile.lock. Then, in your terminal, from the project directory run ```bundle install``` to install all the needed gems.

To setup the database from your terminal, run the following commands:

```
rails db:create
```
```
rails db:migrate
```
```
rails db:seed
```

This will create your database, migrate the needed resources then seed the database with starting data.

## Setting up API

Visit [The Movie Database API](https://www.themoviedb.org/?language=en-US) to create an account and obtain an API key. Refer to the Figaro gem documentation to create your own ```application.yml``` and place your key as follows:

```yml
TMDB_API_KEY: 'INSERT KEY HERE'

```

## Running Tests

From your main directory in the command line, type ```bundle exec rspec```. This will run all tests located in the /spec directory. If any errors or failures occur please create and issue.

To run specific test files, include the file path.
```
bundle exec rspec spec/features/shelters/index_spec.rb
```

## Deployment

Before full cloud based deployment, check that the web app is working locally by opening a new tab in terminal and run the command ```rails s```. This will run a local server which you can connect to. Type ```localhost:3000``` into your web browsers address bar and hit enter. You should see the root page with a welcome message and a login field.

Cloud deployment was done with [Heroku](https://heroku.com/). Visit the ["getting started with rails"](https://devcenter.heroku.com/articles/getting-started-with-rails5) on how to deploy the web app to Heroku.
