class Test < ApplicationRecord
  belongs_to :student
  
  enum test_status: {regular_test:1, pracrice_exam:2, confidential_report:3}
end
