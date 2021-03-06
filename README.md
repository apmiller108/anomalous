[![Build Status](https://travis-ci.org/apmiller108/anomalous.svg?branch=master)](https://travis-ci.org/apmiller108/anomalous)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/3f6a313902294713a7c56cf7dbcbfcc0)](https://www.codacy.com/app/apmiller108/anomalous?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=apmiller108/anomalous&amp;utm_campaign=Badge_Grade)

# Anomalous

Compute paramaters to model data according to the Gaussain 
distribution for probability. Find the best value for epsilon by
testing different values against labeled training data.  Then, 
detect anomalies among new examples.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'anomalous'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install anomalous

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at 
https://github.com/apmiller108/anomalous.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
