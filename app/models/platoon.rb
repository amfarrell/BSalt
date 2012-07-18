class Platoon < ActiveRecord::Base
  belongs_to :commander
  validates_presense_of :commander
  validates_uniqueness_of :commander

end
