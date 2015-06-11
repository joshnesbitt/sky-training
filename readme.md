# Sky Training Materials

Introduction coming soon.


## Projects

All projects should use Test Driven Development. Each project is split into three levels:

* Beginner
* Intermediate
* Advanced


### Domain Specific Language (DSL)

A simple scripting DSL to define user data. It should parse the following input:

```ruby
department 'Development' do

  employee do
    first_name 'Josh'
    last_name 'Nesbitt'
    role 'Software Engineer'
  end

  employee do
    first_name 'Leon'
    last_name 'Davis'
    role 'Software Engineer'
  end

end

department 'Management' do

  employee do
    first_name 'Tracy'
    last_name 'Myers'
    role 'Scrum Master'
  end

end
```


### Twitter Gem

TODO.


### Twitter Interface

Using the gem built in the last project, you should write a simple web interface to searching Twitter. It should:

* Display a search box allowing users to enter search terms
* Make a request to Twitter with that query
* Display the resulting tweets on the page
* Allow those tweets to be favourited / unfavourited by the current user

TODO


## Workshops

There are currently no workshops planned.
