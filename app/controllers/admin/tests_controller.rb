# class Admin::TestsController < ApplicationController

#   def create
#     @test_new= Test.new(test_params)
#     @test_new.save
#     redirect_to admin_student_path(student.id)
#   end

#   def update
#     @test_edit= Test.find(params[:id])
#     @test_.update(test_params)
#     redirect_to admin_student_path(student.id)
#   end

#   private
#   def test_params
#     params.require(:test).permit(:test_name, :english_score, :math_score, :japanese_score, :science_score, :social_score, :test_status)
#   end

# end

class Admin::TestsController < ApplicationController
  before_action :find_student

  
  def create
    @test_new = @student.tests.build(test_params)

    if @test_new.save
      redirect_to admin_student_path(@student)
    else
      redirect_to edit_admin_student(@student)
    end
  end

  def update
    test_edit = @student.tests.find(params[:id])
    if test_edit.update(test_params)
      redirect_to admin_student_path(@student)
    else
      redirect_to edit_admin_student(@student)
    end
  end

  private

  def test_params
    params.require(:test).permit(:test_name, :english_score, :math_score, :japanese_score, :science_score, :social_score, :test_status)
  end

  def find_student
    @student = Student.find(params[:student_id])
  end
end

