
# PartialParameters
Make your partials reusable and self-documented by validating the given parameters in development and test environments.
If a required parameter is missing or an unknown parameter is given, an exception will be raised.

![](https://api.travis-ci.org/julien-meichelbeck/partial_parameters.svg?branch=master)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'partial_parameters'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install partial_parameters

Just include the module `PartialParameters` into your ApplicationHelper and you are ready to go!

## Usage
At the top of your partials, simply call the method `partial_parameters` and list your required and optional parameters:


Erb example:
```erb
  <% partial_parameters { required(:name); required(:age); optional(:height) }%>
```

Slim example:
```slim
  - partial_parameters do
    - required(:name)
    - required(:age)
    - optional(:height)
```

### Strict mode
By default strict mode is enabled and an error will be raised if an unknown parameter has been passed to the partial. Of course, you can disable the strict mode:
```slim
  - partial_parameters(strict: false) do
    - required(:name)
    - required(:age)
    - optional(:height)
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/julien-meichelbeck/partial_parameters.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
