# Fetching JSON via HTTP API

Using [jsontest](http://www.jsontest.com) as an API. Implement a simple API wrapper to make calls to the following endpoints:

* [IP Address](http://www.jsontest.com/#ip)
* [Date and Time](http://www.jsontest.com/#date)
* [MD5](http://www.jsontest.com/#md5)

You should be able to use the wrapper like so:

```ruby
api.ip # => 8.8.8.8
api.date # => 03:53:25 AM
api.md5('testing') # => ae2b1fca515949e5d54fb22b8ed95575
```
