# cryptofont-rails

Cryptofont-rails provides the [Cryptofont](https://cryptofont.com/) web fonts and styles as Rails engine for use with the asset pipeline.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptofont-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptofont-rails

## Usage

In your `application.css`, include the css file:
```
/*
 * require cryptofont
 */
```
Then restart your webserver if it was peviously running.
Congratulation! You now have cryptofont icon support.

### SASS Support
It you prefer SCSS, add this to your `application.css.scss` file:
```
@import "cryptofont"
```
If you use the SASS indented syntax, add this to your `application.css.sass` file:
```
@import cryptofont
```

## Helpers
There are also some helpers `cf_icon` that make your views better read and cleaner.

```ruby
cf_icon "btc"
# => <i class="cf-btc"></i>

cf_icon "ltc", text: "Litecoin"
# => <i class="cf-litecoin"></i> Litecoin

cf_icon "eth", text: "Ethereum", right: true
# => Ethereum <i class="cf-eth"></i>

cf_icon "dash 4x", text: "Dash"
# => <i class="cf-dash cf-4x"></i>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/frizbee/cryptofont-rails.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
* The font is licensed under the SIL OFL 1.1 http://scripts.sil.org/OFL
* The CSS files are licensed under the MIT License http://opensource.org/licenses/mit-license.htm
* Attribution is not required, but much appreciated CryptoFont by @AMPoellmann (alexanderpoellmann.com)
