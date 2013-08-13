# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(:name => "jack", :username => "jack", :password => "jack")
User.create!(:name => "lemon", :username => "lemon", :password => "lemon")
User.create!(:name => "morgan", :username => "morgan", :password => "morgan")

Following.create!(:user_id => 1, :followee_id => 2)
Following.create!(:user_id => 2, :followee_id => 3)
Following.create!(:user_id => 3, :followee_id => 1)