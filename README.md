# Magti 

Magti is a gem for sending SMS messages through [Magticom](http://www.magticom.ge/) gateway.

You need access to Magticom's server, also they provide you with user/password parameters.

## Installation

Add this line to your application's Gemfile:

    gem 'magti'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install magti

## Usage

Start with configuring the gem:

```ruby
Magti.config({:username => 'testuser', :password => 'secret', :service => 1, :client => 1})
```

`username`, `password`, `service` and `client` parameters are provided by Magticom itself.
No additional configuration is required.

Now you can send SMS message by calling `send_sms` method:

```ruby
resp = Magti.send_sms '599XXXXXX', 'test message'
```

`send_sms` returns response object, which contains operation code (`0000` for successfull transactions)
and message identification code, which can be used for further tracking of the message:


```ruby
puts resp.code # => 0000 for normal processing
puts resp.id   # => nil unless resp.code = '0000'
```

After message is sent, then you can track it's progress by calling:

```ruby
status = Magti.track_sms(resp.id)
```

Status value `0` indicates, that the message was delivered to the mobile phone.

## Additional resources

Protocol description which is used by this gem, can be found in `refs` subdirectory.
