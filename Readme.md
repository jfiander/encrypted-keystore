# Rails, Quietly

A simple wrapper to suppress logging in various ways in Rails apps.

## Installation

Add this to your Gemfile:

```ruby
gem 'rails-quietly'
```

or install directly:

```bash
gem install rails-quietly
```

## Inclusion

In `config/applicaiton.rb`, include the following:

```ruby
require 'quietly'
include Quietly::Local
```

This puts the module into global scope.

## Usage

You can either use the `quietly` method with a block:

```ruby
result_b = quietly do
  a = ModelA.query
  ModelB.query(a)
end
```

or manually suppress and restore logging:

```ruby
old_logger = go_quiet

a = ModelA.query
result_b = ModelB.query(a)

end_quiet(old_logger)

result_b
```
