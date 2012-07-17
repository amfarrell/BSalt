class CreateChildren < ActiveRecord::Migration
  def self.up
    create_table :civilians do |t|
      t.integer :family_id :null=>false
      t.integer :citizenship_id :null=>false
      t.datetime :birthdatetime :null => false
      t.text :birthlocation
      t.text :name :null => false
      t.boolean :pacefist?
      t.boolean :physically_fit_for_service?
      t.integer :aggression
      t.integer :competativeness
      t.integer :ingenuity
      t.integer :memory
      t.integer :diligence
      t.timestamps
    end

    create_table :families do |t|
      t.text :lives_at :null => false
      t.timestamps
    end

    create_table :family_roles do |t|
      t.integer :civilian_id
      t.integer :family_id
      t.text :family_role #child or guardian
      t.timestamps
    end

    create_table :cadets do |t|
      t.integer :platoon_id
      t.integer :student_id_number
      t.integer :family_id :null => false
      t.integer :citizenship_id :null => false
      t.datetime :birdthdatetime :null => false
      t.integer :aggression
      t.integer :competativeness
      t.integer :ingenuity
      t.integer :memory
      t.integer :diligence
      t.text :rank
      t.text :birthlocation
      t.text :name :null => false
      t.text :bunk
      t.timestamps
    end

    create_table :platoons do |t|
      t.text :color1
      t.text :color2
      t.integer :commander_id
      t.text :barracks
      t.timestamps
    end

    create_table :courses do |t|
      t.integer :instructor_id :null => false
      t.integer :quadrestor_id :null => false
      t.integer :subject_id :null => false
      t.timestamps
    end

    create_table :quadrestors do |t|
      t.integer :year
      t.text :season #apogee, post-apogee, perogee, post-perogee
      t.timestamps
    end

    create_table :subjects do |t|
      t.text :subject_number :null => false
      t.text :description
      t.timestamps
    end

    create_table :prereqs do |t|
      t.integer :for_course_id :null => false
      t.integer :first_alternative_course_id :null => false
      t.integer :second_alternative_course_id
      t.integer :third_alternative_course_id
      t.timestamps
    end

    create_table :enrollments do |t|
      t.integer :course_id :null => false
      t.integer :cadet_id :null => false
      t.integer :grade
      t.timestamps
    end

    create_table :assignments do |t|
      t.integer :enrollment_id :null => false
      t.integer :grading_instructor_id
      t.integer :grade
      t.integer :title
      t.text :challenge
      t.text :response
      t.timestamps
    end

    create_table :staff_members do |t|
      t.integer :staff_role_id :null => false
      t.text :commanding_officer_id :null => false
      t.text :rank :null => false
      t.text :name
      t.timestamps
    end

    create_table :taships do |t|
      t.integer :staff_member_id
      t.integer :course_id
      t.timestamps
    end

    create_table :staff_roles do |t|
      t.text :name
      t.timestamps
    end

    create_table :messages do |t|
      t.integer :from_id :null => false
      t.integer :to_id :null => false
      t.timestamps
    end

    create_table :notes do |t|
      t.integer :cadet_id
      t.integer :staff_member_id
      t.text :content
      t.timestamps
    end

    create_table :matches do |t|
      t.integer :first_platoon_id :null => false
      t.integer :second_platoon_id :null => false
      t.text :arena :null => false
      t.datetime :start_time :null => false
      t.datetime :end_time
      t.integer :winning_platoon_id
      t.timestamps
    end

    create_table :shots do |t|
      t.integer :match_id :null => false
      t.integer :from_cadet_id :null => false
      t.integer :to_cadet_id
      t.datetime :time_fired
      t.integer :to_cadet_part #either a joint or a vital area.
      #left_angle, right_angle, left_knee, right_knee, left_hip,
      #right_hip, torso, right_fingers, left_fingers, right_wrist,
      #left_wrist, right_elbow, left_elbow, right_shoulder,
      #left_shoulder, neck, head, right_femoral, left_femoral,
      #right_axillary, left_axillary. 
      #Note that if it hits a part that is already hit, it doesn't count
      t.timestamps
    end
  end

  def self.down
    drop_table :civilians 
    drop_table :families 
    drop_table :children_families 
    drop_table :families_guardians 
    drop_table :cadets 
    drop_table :platoons 
    drop_table :courses 
    drop_table :quadrestors 
    drop_table :subjects 
    drop_table :prereqs 
    drop_table :enrollments 
    drop_table :assignments 
    drop_table :staff_members 
    drop_table :taships 
    drop_table :staff_roles 
    drop_table :messages 
    drop_table :notes 
    drop_table :matches 
    drop_table :shots 
  end
end
