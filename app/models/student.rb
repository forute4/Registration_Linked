class Student < ApplicationRecord
  has_many :telephone_numbers
  has_many :comments
  has_many :tests
  
  scope :subscription_today, => { where(subscription_day: Time.zone.now.all_day) }
end
