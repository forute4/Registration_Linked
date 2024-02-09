class Student < ApplicationRecord
  has_many :telephone_numbers
  has_many :comments
  has_many :tests
end
