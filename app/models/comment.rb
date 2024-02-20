class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :admin
  
  validates :comment, presence: true
end
