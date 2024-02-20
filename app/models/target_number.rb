class TargetNumber < ApplicationRecord
  validates :target_name, presence: true
  validates :start_day, presence: true
  validates :finish_day, presence: true
  validates :subscription_number, presence: true
  validates :continue_number, presence: true
end
