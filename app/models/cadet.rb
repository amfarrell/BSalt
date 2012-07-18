class Cadet < ActiveRecord::Base
  belongs_to :platoon
  belongs_to :superior :class_name => "Cadet"
  has_many :subordinates, :class_name => "Cadet", foreign_key => "superior_id"
  validates_presense_of :platoon_id
  validates_presense_of :superior_id
  validates_presense_of :rank
  validates_inclusion_of :rank, :in => ['launchie', 'cadet private', 'cadet sargeant', 'cadet leuitennant', 'cadet captain']
  validates_presense_of :name
  validates_presense_of :student_id_number
  validates_presense_of :bunk
  validates_presense_of :birthdatetime
  validates_presense_of :birthlocation
  validates_presense_of :height
  validates_presense_of :weight
end
