class Admin::StudentsController < ApplicationController

  def index
    @students= Student.all
    @internal_students= Student.where(student_status:2)
  end

  def show
    @student= Student.find(params[:id])
    @telephone= @student.telehone_number
    @comments= @student.comment
    @test= @student.test
    @regular_test= @test.where(test_status:1)
    @practice_exam= @test.where(test_status:2)
    @confidential_report= @test.where(test_status:3)
  end

  def edit
  end

  def update
  end

end
