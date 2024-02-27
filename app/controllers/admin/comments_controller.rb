class Admin::CommentsController < ApplicationController
  protect_from_forgery

  def create
    @student = Student.find(params[:student_id])
    @comment_new = current_admin.comments.new(comment_params)
    @comment_new.student = @student

    if @comment_new.save
      redirect_to admin_student_path(@student)
    else
      redirect_to edit_admin_student(@student)
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end


end
