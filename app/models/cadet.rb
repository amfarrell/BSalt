CAD_CPT = "cadet captain"
CAD_LT = "cadet lieutennant"
CAD_SGT = "cadet sargeant"
CAD_PVT = "cadet private"
COL = "colonel"
RANK_SUBORDINATE_TO = {CAD_CPT => CAD_LT, CAD_LT => CAD_SGT, CAD_SGT => CAD_PVT, CAD_PVT => nil}
RANK_SUPERIOR_TO = {CAD_CPT => nil, CAD_LT => CAD_CPT, CAD_SGT => CAD_LT, CAD_PVT => CAD_SGT}

class Cadet < ActiveRecord::Base
  belongs_to :platoon

  belongs_to :superior, :class_name => "Cadet"
  has_many :subordinates, :class_name => "Cadet", :foreign_key => "superior_id"

#  validates_presence_of :platoon
#  validates_presence_of :superior_id
  validates_presence_of :rank
  validates_inclusion_of :rank, :in => [COL, CAD_PVT, CAD_SGT, CAD_LT, CAD_CPT]
  validates_presence_of :name
  validates_presence_of :student_id_number
  validates_presence_of :bunk
  #validates_presence_of :birthdatetime
  #validates_presence_of :birthlocation
  #validates_presence_of :height
  #validates_presence_of :weight
  def build_subordinate(name, student_id_number)
    if RANK_SUBORDINATE_TO[self.rank] == nil
      raise "#{self.name} is a #{self.rank}, the lowest rank and cannot have subordinates."
    else
      bunk = self.bunk
      bunk[{CAD_CPT => -3, CAD_SGT => -1, CAD_LT => -2}[self.rank]] = self.subordinates.count.to_s
      puts "z"
      puts bunk
      r = self.subordinates.build(:rank => RANK_SUBORDINATE_TO[self.rank], :platoon => self.platoon, :name => name, :student_id_number => student_id_number, 
                                  :bunk => bunk)
    end
  end

  def assign_bunk
    if RANK_SUPERIOR_TO[self.rank] == nil
      bunk = self.platoon.barracks + "0" * RANK_SUPERIOR_TO * length
    else
      bunk = self.superior.bunk
      bunk[{CAD_LT => -3, CAD_SGT => -2, CAD_PVT => -1}[self.rank]] = self.superior.subordinates.count
      #XXX race: this will assign two people to the same bunk if they are both assigned to this superior before being given bunks.
      #XXX performance: this queries two tables just to assign a bunk if used outside of its current call.
      #XXX this doesn't work for captains as it is private
    end
  end
end
