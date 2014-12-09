# Jupiter

Jupiter is the king of the gods and the god of sky and thunder in myth. Jupiter assumed atmospheric qualities; he is the wielder of lightning and the master of weather

This AWESOME gem allow you to get the current forecast for any city of the world.

## Installation

Since is currently in development and its not in rubygems, to install you must:

clone the repository

```bash
git clone https://github.com/jcostello/Jupiter.git
```

install the dependencies through bundler

```bash
bundle install
```

build the gem

```bash
gem build jupiter.gemspec
```

and finaly you can install from the generated file

```bash
gem install jupiter.[version].gem
```

## Usage

To use it you only have to:

Include the gem 

```ruby
require 'jupiter'
```

and ask the forecast for the city you want

```ruby
Jupiter.forecast_for_today("Buenos Aires")
```

In case of a mispell of the city name a CityNotFoundException will be raiced

By default, the gem use Imperial system, to use Metric system you have to tell the gem before ask for the forecast

```ruby
Jupiter.system = "Metric"
```

In case of a mispell of the system, the last setted or the default system will be used

## Contributing

1. Fork it ( https://github.com/jcostello/jupiter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
