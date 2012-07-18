# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
require "models/cadet.rb"
require "models/platoon.rb"
Cadet.create(:rank => "cadet captain", :name => "Bonzo Madrid", :student_id_number => "13-0303", :bunk => "06-100", :birthdatetime =>  
