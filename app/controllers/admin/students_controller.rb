class Admin::StudentsController < ApplicationController
  before_action :authenticate_admin!
  protect_from_forgery

  def index
    @students= Student.all
    #生徒ステータスが体験生内部生の生徒
    @internal_students= Student.where(student_status: ['trial_student','internal_student'])
    @grades = @internal_students.grades.keys
    @selected_grade = params[:grade]
    if @selected_grade.present?
      @selected_students = @internal_students.where(grade: @selected_grade)
    else
      @selected_students = @internal_students
    end
  end

  def show
    @student= Student.find(params[:id])
    @comments= @student.comments
    @tests= @student.tests
    if @tests.present?
      @regular_test= @tests.where(test_status: 'regular_test')
      @practice_exam= @tests.where(test_status: 'pracrice_exam')
      @confidential_report= @tests.where(test_status: 'confidential_report')
    else
      @tests
    end
  end

  def edit
    @student= Student.find(params[:id])
    @comments= @student.comments
    @comment_new= Comment.new
    @test_new= Test.new
    @tests= @student.tests
    if @tests.present?
      @regular_test= @tests.where(test_status: 'regular_test')
      @practice_exam= @tests.where(test_status: 'pracrice_exam')
      @confidential_report= @tests.where(test_status: 'confidential_report')
    else
      @tests
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to admin_student_path(@student)
    else
      redirect_to edit_admin_student_path(@student)
    end
  end



  private

    def student_params
      params.require(:student).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                      :address, :email, :post_code, :school_name, :grade, :telephone_number,
                                      :student_status, :situation_status)
    end


end
