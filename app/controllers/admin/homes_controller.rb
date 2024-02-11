class Admin::HomesController < ApplicationController
  
  def top
    # これだとstudentのデータを持ってきた後にその中のコメントのデータを持ってくるため細心のコメントが持ってこれているわけではない細心のコメントが持ってこれているわけではない
    # @danger_student= Studnet.where(situation_status:3)
    # @new_comment= @danger_student.comments.order(created_at: :desc)
    #この書き方だと結合したテーブル内で同名のカラムがあった際にエラーが起きる。対処法としては下記の書き方にするか、結合するテーブルにおいては同名のカラム名は避ける
    #@new_comment= Comment.where("created_at >= ?", Date.today).includes(:student).where(student: {situation_status: 3})
    comments = Comment.includes(:student).where("created_at >= ?", Date.today)
    @new_comments = comments.filter_map { |comment| comment.student.situation_status == 3}

    @today_subscriptions= Student.subscription_today
  end
  
end
