
class Feeling < ActiveRecord::Base

  #invariant there cannot be an allegance from a political entity to an individual
end
class PoliticalEntity < ActiveRecord::Base
  has_many :
end
