class Student < ApplicationRecord
  has_many :comments
  has_many :tests
  
  scope :subscription_today, -> { where(subscription_day: Time.zone.now.all_day) }
  
  enum student_status: {trial_student: 1, internal_student: 2, leaving_student: 3}
  enum situation_status: {A: 1, B: 2, C: 3}
  enum grade: {grade_5: 1, grade_6: 2, grade_1: 3, grade_2: 4, grade_3: 5}
  
  def full_name
    self.last_name + "" + self.first_name
  end
  
end
