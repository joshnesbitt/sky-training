require 'sequel'
require 'sqlite3'

#
# Setup
#

DB = Sequel.sqlite
DB.create_table :posts do
  primary_key :id
  String :title
  String :content
  String :category
  Time :created_at
  Time :updated_at
end

#
# Simple SQL interface
#

posts = DB[:posts]
posts.insert(title: 'How to A', category: 'code', content: 'Post content...', created_at: Time.now, updated_at: Time.now)
posts.insert(title: 'How to B', category: 'announcement', content: 'Post content...', created_at: Time.now, updated_at: Time.now)
posts.insert(title: 'Announcing this thing!', category: 'announcement', content: 'Post content...', created_at: Time.now, updated_at: Time.now)

post = posts.first

puts posts.count
puts post[:title]
puts post[:content]
puts post[:category]
puts post[:created_at].strftime('%d %m %Y')

#
# Model interface
#

class Post < Sequel::Model
end

post = Post.where(title: 'How to A').first

puts post[:title]
puts post[:content]
puts post[:created_at].strftime('%d %m %Y')

#
# Implementing custom search
#

class Post < Sequel::Model
  class << self

    SEARCH_FILTER_SEPARATOR = ":"
    SEARCH_FILTER_REGEX = /([^\s]+:[^\s]+)/

    def search(query, options = {})
      return none if query.strip.empty?

      relation = self

      query.gsub!(SEARCH_FILTER_REGEX) do |match|
        nil.tap do
          relation = extract_filter(relation, match)
        end
      end

      relation.where("title LIKE ?", "%#{query.strip}%")
    end

  private

    def extract_filter(relation, match)
      attribute, value = match.split(SEARCH_FILTER_SEPARATOR)

      if valid_column?(attribute)
        relation.where(attribute.to_sym => value)
      else
        relation
      end
    end

    def valid_column?(name)
      columns.include?(name.to_sym)
    end

    def none
      where('1 = 0')
    end

  end
end

results = Post.search('How to')

puts results.count
puts results.first[:title]
puts results.first[:category]
puts results.last[:title]
puts results.last[:category]

results = Post.search('How to category:code')

puts results.count
puts results.first[:title]
puts results.first[:category]

results = Post.search('category:announcement')

puts results.count
puts results.first[:title]
puts results.first[:category]

# RSpec.configure do |c|
#   c.around(:each) do |example|
#     DB.transaction(:rollback=>:always, :auto_savepoint=>true){example.run}
#   end
# end
