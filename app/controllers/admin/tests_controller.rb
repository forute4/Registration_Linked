class Admin::TestsController < ApplicationController
  
  def create
    @test_new= Test.new(test_params)
    @test_new.save
    redirect_to admin_student_path(student.id)
  end
  
  def update
    @test_edit= Test.find(params[:id])
    @test_.update(test_params)
    redirect_to admin_student_path(student.id)
  end

  private
   def test_paprams
     params.require(test).permit(:test_name, :english_score, :math_score, :japanese_score, :science_score, :social_score, :test_status)
   end
  
end
