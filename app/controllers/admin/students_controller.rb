class Admin::StudentsController < ApplicationController
  protect_from_forgery

  def index
    @students= Student.all
    @internal_students= Student.where(student_status: 2)
  end

  def show
    @student= Student.find(params[:id])
    @telephones= @student.telephone_numbers
    @comments= @student.comments
    @tests= @student.tests
    if @tests.present?
      @regular_test= @tests.where(test_status: 1)
      @practice_exam= @tests.where(test_status: 2)
      @confidential_report= @tests.where(test_status: 3)
    else
      @tests
    end
  end

  def edit
    @student= Student.find(params[:id])
    @student_form = MakeStudentForm.new(student_attributes)
    @telephones= @student.telephone_numbers
    @comments= @student.comments
    @comment_new= Comment.new
    @test_new= Test.new
    @tests= @student.tests
    if @tests.present?
      @regular_test= @tests.where(test_status: 1)
      @practice_exam= @tests.where(test_status: 2)
      @confidential_report= @tests.where(test_status: 3)
    else
      @tests
    end
  end

  def update
    @student = Student.find(params[:id])
    @student_form = MakeStudentForm.new(student_params)
    if @student_form.update_student(@student)
      redirect_to admin_student_path(@student)
    else
      render :edit
    end
  end

  private

    def student_params
      params.require(:make_student_form).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :email, :post_code, :school_name, :grade, :number, :student_status, :situation_status)
    end

    def student_attributes
    {
      last_name: @student.last_name,
      first_name: @student.first_name,
      last_name_kana: @student.last_name_kana,
      first_name_kana: @student.first_name_kana,
      post_code: @student.post_code,
      address: @student.address,
      email: @student.email,
      grade: @student.grade,
      school_name: @student.school_name,
      student_status: @student.student_status,
      situation_status: @student.situation_status,
      number: @student.telephone_numbers&.pluck(:number) # 電話番号は複数ある可能性があるので注意
      # 他の属性も同様に...
    }
    end

end
