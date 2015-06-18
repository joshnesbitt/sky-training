# Sinatra Testing with Rack::Test

Create a simple Sinatra application that authenticates a user via a JSON API and returns an authentication token. For now the user credentials (username/password) can be hard-coded.

The application should be tested with [Rack::Test](https://github.com/brynary/rack-test). You should have at least two test cases:

* Testing a user successfully authenticates and receives an authentication token
* Testing a user fails to authenticate and returns an empty response

The response for a successful request should be similar to:

```
{
  success: true,
  token: '32925e4e8b6648afa2659f807e74cce8'
}
```

The response for an unsuccessful request should be similar to:

```
{
  success: false,
  token: null
}
```

It should also return a 401 Unauthorized status code.
