class Admin::CommensController < ApplicationController
  
  def create
    @comment= Comment.new(comment_params)
    @comment.save
    redirect_to admin_student_path(student.id)
  end
  
  private
  
  def comment_params
    params.require(comment).permit(:comment)
  end
end
