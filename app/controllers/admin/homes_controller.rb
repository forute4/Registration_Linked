class Admin::HomesController < ApplicationController
  
  def top
    # これだとstudentのデータを持ってきた後にその中のコメントのデータを持ってくるため細心のコメントが持ってこれているわけではない細心のコメントが持ってこれているわけではない
    # @danger_student= Studnet.where(situation_status:3)
    # @new_comment= @danger_student.comments.order(created_at: :desc)
    @new_comment= Comment.include(:student).where(student: {situation_status: 3}).where("created_at >= ?", Date.today)
    @today_subscriptions= Student.created_today
  end
  
end
