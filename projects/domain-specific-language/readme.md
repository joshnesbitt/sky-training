# Domain Specific Language (DSL)

Create a simple scripting DSL to define user data. It should parse the following input:

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

And parse it into objects to be manipulated like so:

```ruby
departments.each do |department|

  puts department.name

  department.employees.each do |person|

    puts "  #{person.first_name} #{person.last_name}: #{person.role}"

  end

end
```

Which should output the following:

```
Development
  Josh Nesbitt: Software Engineer
  Leon Davis: Software Engineer
Management
  Tracy Myers: Scrum Master
```

The project should use well known testing practices and make thorough use of objects.
