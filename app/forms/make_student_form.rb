class MakeStudentForm
  include ActiveModel::Model

  attr_accessor :last_name, :first_name, :last_name_kana, :first_name_kana,
                :post_code, :address, :email, :grade, :school_name, :student_status,
                :situation_status, :subscription_day, :number


  def initializse(attributes = nil)
    @subscription= Student.new
    @telephone_number= TlephoneNumber.new
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    ActiveRecord::Base.transaction do
      student = Student.create(last_name:, first_name:, last_name_kana:, first_name_kana:, subscription_day:,
                     post_code:, address:, email:, grade:, school_name:, student_status:, situation_status:)
      TelephoneNumber.create(student_id: student.id, number: )
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def update_student(student)
    ActiveRecord::Base.transaction do
      Student.update(
        last_name: last_name, first_name: first_name,
        last_name_kana: last_name_kana, first_name_kana: first_name_kana,
        post_code: post_code, address: address, email: email,
        grade: grade, school_name: school_name,
        student_status: student_status, situation_status: situation_status
      )
      TelephoneNumber.update(number: number)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end


  # def update_student
  #   ActiveRecord::Base.transaction do
  #     Student.update(last_name:, first_name:, last_name_kana:, first_name_kana:,
  #                   post_code:, address:, email:, grade:, school_name:, student_status:, situation_status:)
  #     TelephoneNumber.update(number:)
  #   end
  # rescue ActiveRecord::RecordInvalid
  #   false
  # end

  private


  def default_student_status
    1
  end


  def default_situation_status
    1
  end

  attr_reader :student, :telephone_number

  def default_attributes
    {
      last_name: student.last_name,
      first_name: student.first_name,
      last_name_kana: student.last_name_kana,
      first_name_kana: student.first_name_kana,
      post_code: student.post_code,
      address: student_address,
      email: student.email,
      grade: student.grade,
      school_name: student.school_name,
      student_status: student.student_status,
      # situation_status: student.situation_status:,
      # subscription_day: student.subscription_day:,
      number: telephone_nunmber.number
    }
  end


end
