# Fetching JSON via HTTP API

Using [jsontest](http://www.jsontest.com) as an API. Implement a simple API wrapper to make calls to the following endpoints:

* [IP Address](http://www.jsontest.com/#ip)
* [Date and Time](http://www.jsontest.com/#date)
* [MD5](http://www.jsontest.com/#md5)

You should be able to use the wrapper like so:

```ruby
api.ip # => 8.8.8.8
api.date # => 03-02-2013
api.md5(text: 'testing') # => ae2b1fca515949e5d54fb22b8ed95575
```

The final program should output:

```
IP:
90.216.134.198
Date:
06-18-2015
MD5:
ae2b1fca515949e5d54fb22b8ed95575
```
