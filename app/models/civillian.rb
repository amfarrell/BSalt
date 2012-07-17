class Civillian < ActiveRecord::Base
end
class Family < ActiveRecord::Base
end
class Cadet < ActiveRecord::Base 
end
class Platoon < ActiveRecord::Base 
end
class StaffMember < ActiveRecord::Base 
  has_many :subordinates, :class_name => 'StaffMember', :foreignkey => 'commanding_officer_id'
  #I'm copying this from http://guides.rubyonrails.org/association_basics.html 2.10 Self Joins
  #but why is it a string and not a symbol?
  belongs_to :commanding_officer, :class_name => 'StaffMember'

  #check that CO is of higher rank.
end
class Staff_Role < ActiveRecord::Base
end
class Course < ActiveRecord::Base 
end
class Assignment < ActiveRecord::Base 
end
class Mark < ActiveRecord::Base 
end
class Message < ActiveRecord::Base 
end
class Note < ActiveRecord::Base 
end
class Match < ActiveRecord::Base 
end
class Shot < ActiveRecord::Base 
end

