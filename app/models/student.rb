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

  def full_name_kana
    self.last_name_kana + "" + self.first_name_kana
  end

  def self.search(search)
    if search.present?
      # ref: https://style.potepan.com/articles/30406.html [CONCATによる文字結合]
      @students = where(['last_name LIKE(?) or first_name LIKE(?) or first_name_kana LIKE(?) or last_name_kana LIKE(?) or CONCAT(last_name, first_name) LIKE(?) or CONCAT(last_name_kana, first_name_kana) LIKE(?)',
                        "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%","%#{search}%","%#{search}%"])
    else
      @students = all
    end
  end

end
