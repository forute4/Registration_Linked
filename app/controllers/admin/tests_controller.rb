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

  # def create
  #   @test_new = @student.tests.build(test_params)
  #   byebug
  #   if @test_new.save
  #     redirect_to admin_student_path(@student)
  #   else
  #     # エラー処理が必要な場合に追加
  #     render :new
  #   end
  # end
  def create
    @test_new = @student.tests.build(test_params)
  
    if @test_new.save
      redirect_to admin_student_path(@student), notice: 'テストが登録されました。'
    else
      # もし保存に失敗した場合の処理を追加することも考えてください
      flash.now[:alert] = 'テストの登録に失敗しました。'
      render 'admin_students/show' # または適切なビュー名を指定してください
    end
  end

  def update
    @test_edit = @student.tests.find(params[:id])
    if @test_edit.update(test_params)
      redirect_to admin_student_path(@student)
    else
      # エラー処理が必要な場合に追加
      render :edit
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

