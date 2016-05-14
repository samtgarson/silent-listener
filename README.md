# SilentListener

> Listen out for selectors and instantiate your classes

SilentListener allows you to define _SilentListeners_ which will be instantiated whenever an element appears which matches a given selector. It also comes with some handy functionality for reinstantiating classes using events, and handling class options.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'silent_listener'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install silent_listener

## Usage

### Dependencies

This gem comes with `rails-coffee` as it is written in CoffeeScript, but also depends on jQuery or some other dom selection library which uses `$` (e.g. [Sprint](https://github.com/bendc/sprint)). It leaves that choice up to you.

### Setup

To define a silent listener, name your class as a `SilentListener`, and make it a descendant of the `SilentListener` class:

```coffeescript
class SilentListeners.MyClass extends SilentListener
```

To add a selector to listen out for, define a class variable called `silentListenerSelector`:

```coffeescript
    @silentListenerSelector: '.my-class'
```

Once your class has been instantiated, a class method instantiate will be called (if it exists), and a class variable called `el` will be set:

```coffeescript
    instantiate: =>
        @el.doSomething()
```

The elements will have the instance of its silent listner class set on a data attribute `data-silent-listener`, as well as being accessible on the class variable `instances`. 

e.g.:

```coffeescript```
    $('.my-class').first().data('silent-listener') # => bound class instance
    MyClass.instances # => array of all class instances
```

### Options

Given an element with the data attribute `data-listener-options`, silent listeners will merge the `data-listener-options` hash with the result of an instance method called `_defaultOptions` and set an instance variable called `options` upon instantiation.

e.g.:

```html
<div class="my-class" data-listener-options="{ some-option: true }"></div>
```

```coffeescript
class SilentListeners.MyClass extends SilentListener
    @silentListenerSelector: '.my-class'

    instantiate: =>
        console.log(@options)

    # the underscore implies a private method, despite the concept not existing yet
    _defaultOptions: =>
        some-option: false
```

### Events
Each silent listener can told to look again for its selector by calling `MyClass.bindSelf()`

You can also tell all of your silent listeners to rebind themselves by calling `SilentListener.bindAll()`


## Development

### ToDo: Test coverage, potentially using [konacha](https://github.com/jfirebaugh/konacha)

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/silent_listener. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

