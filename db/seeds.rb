# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
#require "models/cadet.rb"
#require "models/platoon.rb"
=begin
asp = Platoon.new(:name => "asp", :major_color => "ffff33", :minor_color => "ffcc66", :barracks => "01")
#asp.cadets.build(:rank => "cadet captain", :name => "Robert Jakubik", :student_id_number => "00-0000", :bunk => "01-000")
rob = asp.cadets.build(:rank => CAD_CPT, :name => "Robert Jakubik", :superior_id => 0, :platoon => asp, :student_id_number => "04-0000", :bunk => "01-000")
a = asp.cadets.build(:rank => CAT_LT, :superior => rob, :name => "Chuck Testa", :student_id_number => "06-0001", :bunk => "01-100")
b = asp.cadets.build(:rank => CAT_LT, :superior => rob, :name => "John Falmouth", :student_id_number => "06-0351", :bunk => "01-200")
c = asp.cadets.build(:rank => CAD_LT, :superior => rob, :name => "Frederick Chatham", :student_id_number => "07-0361", :bunk => "01-300")
d = asp.cadets.build(:rank => CAD_LT, :superior => rob, :name => "Israel Putnam", :student_id_number => "05-0891", :bunk => "01-400")
d.build_subordinate(:name => "Gregory Peck", :student_id_number => "06-0321")
d.build_subordinate(:name => "James Ma", :student_id_number => "08-0221")
d.build_subordinate(:name => "Y-lin Hsin", :student_id_number => "04-0111")
d.build_subordinate(:name => "Gregory Peck", :student_id_number => "06-0321")
puts asp.valid?
puts asp.errors.full_messages
asp.save!

asp = Platoon.new(:name => "asp", :major_color => "ffff33", :minor_color => "ffcc66", :barracks => "01")
badger = Platoon.create(:name => "badger", :major_color => "ff9900", :minor_color => "663300", :barracks => "02")
b = badger.cadets.build(:rank => "cadet captain", :name => "Babatunde Olatunji", :student_id_number => "02-0459", :bunk => "02-000", :superior => Cadet.first)
#XXX Should not point to the captain of another team.

puts b.build_subordinate("Edward Jenner","04-5478").errors.full_messages
b.build_subordinate("Edward Jenner","04-5478").errors.full_messages
b.build_subordinate("Edward Jenner","04-5478").errors.full_messages
b.build_subordinate("Edward Jenner","04-5478").errors.full_messages
b.build_subordinate("Edward Jenner","04-5478").errors.full_messages
b.build_subordinate("Edward Jenner","04-5478")
b.build_subordinate("Edward Jenner","04-5478")
b.build_subordinate("Edward Jenner","04-5478")
b.build_subordinate("Edward Jenner","04-5478")
b.build_subordinate("Edward Jenner","04-5478")
b.build_subordinate("Edward Jenner","04-5478")
b.build_subordinate("Edward Jenner","04-5478")
b.build_subordinate("Edward Jenner","04-5478")
b.build_subordinate("Edward Jenner","04-5478")
b.build_subordinate("Edward Jenner","04-5478")
badger.save
=end
require 'forgery'
def populate_subordinates(officer)
  unless officer.rank == CAD_SGT
    4.times do
      sub = officer.build_subordinate(Forgery::Name.full_name , :student_id_number => Forgery::Basic.number.to_s()+"-"+Forgery::Basic.number.to_s())
      sub.save
      populate_subordinates(sub)
    end
  end
end

def populate_platoon(platoon)
  captain = platoon.cadets.build(:rank => "cadet captain", :name => Forgery::Name.full_name , :student_id_number => Forgery::Basic.number.to_s()+"-"+Forgery::Basic.number.to_s(), 
                        :bunk => platoon.barracks+"-000", :superior => Cadet.first, :platoon => platoon)
  captain.save!
  populate_subordinates(captain)
end
root = Cadet.new(:name => "Hiram Graff", :bunk => "0", :rank => "colonel", :platoon_id => 0, :superior_id => 0, :student_id_number => "00-000")
root.save!() #:validate => false)
asp = Platoon.new(:name => "asp", :major_color => "ffff33", :minor_color => "ffcc66", :barracks => "01")
badger = Platoon.create(:name => "badger", :major_color => "ff9900", :minor_color => "663300", :barracks => "02")
condor = Platoon.create(:name => "condor", :major_color => "999999", :minor_color => "ffffff", :barracks => "03")
centipede = Platoon.create(:name => "centipede", :major_color => "00ff00", :minor_color => "ffff00", :barracks => "04")
dragon = Platoon.create(:name => "dragon", :major_color => "666666", :minor_color => "ff6600", :barracks => "05")
ferret = Platoon.create(:name => "ferret", :major_color => "663300", :minor_color => "666666", :barracks => "06")
flame = Platoon.create(:name => "flame", :major_color => "ff0000", :minor_color => "0000ff", :barracks => "07")
griffin = Platoon.create(:name => "griffin", :major_color => "0000ff", :minor_color => "ffff00", :barracks => "08")
hound = Platoon.create(:name => "hound", :major_color => "996600", :minor_color => "666666", :barracks => "09")
leopard = Platoon.create(:name => "leopard", :major_color => "00ff00", :minor_color => "444444", :barracks => "10")
manticore = Platoon.create(:name => "manticore", :major_color => "000000", :minor_color => "0000ff", :barracks => "11")
phoenix = Platoon.create(:name => "phoenix", :major_color => "ff0000", :minor_color => "000000", :barracks => "12")
rabbit = Platoon.create(:name => "rabbit", :major_color => "666666", :minor_color => "0000ff", :barracks => "13")
rat = Platoon.create(:name => "rat", :major_color => "666666", :minor_color => "444444", :barracks => "14")
salamander = Platoon.create(:name => "salamander", :major_color => "00ff00", :minor_color => "996600", :barracks => "15")
tiger = Platoon.create(:name => "tiger", :major_color => "000000", :minor_color => "ff9900", :barracks => "16")

populate_platoon(asp)
populate_platoon(badger)
populate_platoon(condor)
populate_platoon(centipede)
populate_platoon(dragon)
populate_platoon(ferret)
populate_platoon(flame)
populate_platoon(griffin)
populate_platoon(hound)
populate_platoon(leopard)
populate_platoon(manticore)
populate_platoon(phoenix)
populate_platoon(rabbit)
populate_platoon(rat)
populate_platoon(salamander)
populate_platoon(tiger)


#condor.commander = Cadet.create(:rank => "cadet captain", :name => "Jae Young-meng", :platoon => condor,  :student_id_number => "00-0000", :bunk => "03-000")
#centipede.commander = Cadet.create(:rank => "cadet captain", :name => "Han Tsu", :platoon => centipede, :student_id_number => "00-0000", :bunk => "04-000")
#dragon.commander = Cadet.create(:rank => "cadet captain", :name => "Ender Wiggin", :platoon => dragon, :student_id_number => "00-0000", :bunk => "05-000")
#ferret.commander = Cadet.create(:rank => "cadet captain", :name => "Elizabeth Lowell", :platoon => ferret, :student_id_number => "00-0000", :bunk => "06-000")
#flame.commander = Cadet.create(:rank => "cadet captain", :name => "Manu Gibbons", :platoon => flame, :student_id_number => "00-0000", :bunk => "07-000")
#griffin.commander = Cadet.create(:rank => "cadet captain", :name => "Julian Rowlands", :platoon => griffin, :student_id_number => "00-0000", :bunk => "08-000")
#hound.commander = Cadet.create(:rank => "cadet captain", :name => "Felix Fan", :platoon => hound, :student_id_number => "00-0000", :bunk => "09-000")
#leopard.commander = Cadet.create(:rank => "cadet captain", :name => "Seamus Finnigan", :platoon => leopard, :student_id_number => "00-0000", :bunk => "10-000")
#manticore.commander = Cadet.create(:rank => "cadet captain", :name => "Pol Slattery", :platoon => manticore, :student_id_number => "00-0000", :bunk => "11-000")
#phoenix.commander = Cadet.create(:rank => "cadet captain", :name => "Talo Momoe", :platoon => phoenix, :student_id_number => "00-0000", :bunk => "12-000")
#rabbit.commander = Cadet.create(:rank => "cadet captain", :name => "Filippus Rietveld", :platoon => rabbit, :student_id_number => "00-0000", :bunk => "13-000")
#rat.commander = Cadet.create(:rank => "cadet captain", :name => "Rose Denosque", :platoon => rat, :student_id_number => "00-0000", :bunk => "14-000")
#salamander.commander = Cadet.create(:rank => "cadet captain", :name => "Zeck Morgan", :platoon => salamander, :student_id_number  => "00-0000", :bunk => "15-000")
#tiger.commander = Cadet.create(:rank => "cadet captain", :name => "Thomas Hobbes", :platoon => tiger, :student_id_number => "00-0000", :bunk => "16-000")
