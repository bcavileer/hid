# HID

[![Code Climate](https://codeclimate.com/github/bcavileer/hid/badges/gpa.svg)](https://codeclimate.com/github/bcavileer/hid)

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'hid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hid

## Usage

Configure (optional):

    HID.configure do |config|
        config.identifier = SomeIdentifier
        config.recorder = SomeRecorder
    end

Examples: (these were executed **in order** in a REPL)
    
    HID.identify 'foo'
    => nil
    
    HID.map 'bar', 'baz'
    => nil
    
    HID.identify 'bar'
    => "baz"
    
    HID.recorded
    => {nil=>["foo"]}
    
    HID.map 'persistance', 'persistence', 'typos'
    => nil
    
    HID.identify 'persistance', 'typos'
    => "persistence"
    
    HID.identify 'persistance'
    => nil
    
    HID.recorded
    => {nil=>["foo", "persistance"]}
    
    HID.identify 'fizz', 'buzz'
    => nil
    
    HID.recorded
    => {nil=>["foo", "persistance"], "fizz" => ["buzz"]}

## Contributing

1. Fork it ( https://github.com/[my-github-username]/hid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
