# HidCore

[![Code Climate](https://codeclimate.com/github/bcavileer/hid_core/badges/gpa.svg)](https://codeclimate.com/github/bcavileer/hid)

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'hid_core'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hid_core

## Usage

Configure (optional):

    HidCore.configure do |config|
        config.identifier = SomeIdentifier
        config.recorder = SomeRecorder
    end

Examples: (these were executed **in order** in a REPL)
    
    HidCore.identify 'foo'
    => nil
    
    HidCore.map 'bar', 'baz'
    => nil
    
    HidCore.identify 'bar'
    => "baz"
    
    HidCore.recorded
    => {nil=>["foo"]}
    
    HidCore.map 'persistance', 'persistence', 'typos'
    => nil
    
    HidCore.identify 'persistance', 'typos'
    => "persistence"
    
    HidCore.identify 'persistance'
    => nil
    
    HidCore.recorded
    => {nil=>["foo", "persistance"]}
    
    HidCore.identify 'fizz', 'buzz'
    => nil
    
    HidCore.recorded
    => {nil=>["foo", "persistance"], "fizz" => ["buzz"]}

## Contributing

1. Fork it ( https://github.com/[my-github-username]/hid_core/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
