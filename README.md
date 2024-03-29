# SpreeQuickbooks

Introduction goes here.

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_quickbooks', github: '[your-github-handle]/spree_quickbooks'
  ```

2. Install the gem using Bundler:

  ```shell
  bundle install
  ```

3. Add to app/helpers/application_helper.rb:

  ```ruby
  require 'money-rails/helpers/action_view_extension'

  module ApplicationHelper
    include MoneyRails::ActionViewExtension
    ...
  end
  ```


4. Copy & run migrations
  ```shell
  bundle exec rails g money_rails:initializer
  bundle exec rails g spree_quickbooks:install
  ```

5. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Testing

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_quickbooks/factories'
```


## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2019 [name of extension creator], released under the New BSD License
