class Admin::StudentsController < ApplicationController

  def index
    @students= Student.all
    @internal_students= Student.where(student_status: internal_student)
  end

  def show
    @student= Student.find(params[:id])
    @telephone= @student.telehone_number
    @comments= @student.comment
    @test= @student.test
    @regular_test= @test.where(test_status: regular_test)
    @practice_exam= @test.where(test_status: paractice_exam)
    @confidential_report= @test.where(test_status: confidential_report)
  end

  def edit
  end

  def update
  end

end
