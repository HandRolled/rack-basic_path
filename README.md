# Rack Regex Constrained BasicAuth Middleware

`Rack::Auth::BasicPath` implements basic auth for paths that match the specified RegEx.

## Installation

Install the gem:

`gem install basic_path`

Or in your Gemfile:

```ruby
gem 'rack-basic_path'
```


## Configuration

### Rails Configuration
Put something similar to the code below in `config/application.rb` of your Rails application. This would require basic auth for anything under `/webhooks/squanchy`.

```ruby
module YourApp
  class Application < Rails::Application
    # ...

    # Rails 5
    config.middleware.use Rack::Auth::BasicPath, "johnny_marbles@rickandmorty.com", "super-squanch", /\/webhooks\/squanchy\/.*/

  end
end
```
