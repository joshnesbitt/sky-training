class Environment
  class Department
    attr_reader :name,
                :employees

    def initialize(name, &block)
      @name = name
      @employees = []

      instance_eval(&block)
    end

    def employee(&block)
      @employees << Employee.new(&block)
    end
  end

  class Employee

    def initialize(&block)
      @first_name = nil
      @last_name = nil
      @role = nil

      instance_eval(&block)
    end

    %w( first_name last_name role ).each do |method|
      define_method method do |*args|
        attribute = "@#{method}"

        if args.empty?
          self.instance_variable_get(attribute)
        else
          self.instance_variable_set(attribute, args.first)
        end
      end
    end
  end

  attr_reader :departments

  def initialize(&block)
    @departments = []

    instance_eval(&block)
  end

  def department(name, &block)
    departments << Department.new(name, &block)
  end
end

env = Environment.new do

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

end

env.departments.each do |department|

  puts department.name

  department.employees.each do |person|

    puts "  #{person.first_name} #{person.last_name}: #{person.role}"

  end

end
