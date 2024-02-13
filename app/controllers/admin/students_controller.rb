class Admin::StudentsController < ApplicationController

  def index
    @students= Student.all
    @internal_students= Student.where(student_status: 2)
  end

  def show
    @student= Student.find(params[:id])
    # @telephone= @student.telehone_number
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
    @telephone= @student.telehone_number
    @comments= @student.comments
    @regular_test= @test.where(test_status: 1)
    @practice_exam= @test.where(test_status: 2)
    @confidential_report= @test.where(test_status: 3)
  end

  def update
    @student= MakeStudentForm.find(params[:id])
    @student.update(student_params)
    redirect_to edit_admin_student
  end
  
  
  private 
  
    def student_params
      params.require(make_student_form).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :email, :post_code, :school_name, :grade, :number, :student_status, :situation_status)
    end

end
