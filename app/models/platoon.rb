class Platoon < ActiveRecord::Base
  validates_presence_of :barracks
  validates_presence_of :major_color
  has_many :cadets

end
