class Admin::CommentsController < ApplicationController
  protect_from_forgery

  def create
    @student = Student.find(params[:student_id])
    @comment_new = current_admin.comments.new(comment_params)
    @comment_new.student = @student
  
    if @comment_new.save
      redirect_to admin_student_path(@student), notice: 'コメントが投稿されました。'
    else
      # もし保存に失敗した場合の処理を追加することも考えてください
      flash.now[:alert] = 'コメントの投稿に失敗しました。'
      render 'admin_students/show' # または適切なビュー名を指定してください
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end


end
