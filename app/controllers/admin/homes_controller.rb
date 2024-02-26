class Admin::HomesController < ApplicationController
  def top
    # これだとstudentのデータを持ってきた後にその中のコメントのデータを持ってくるため細心のコメントが持ってこれているわけではない細心のコメントが持ってこれているわけではない
    # @danger_student= Studnet.where(situation_status:3)
    # @new_comment= @danger_student.comments.order(created_at: :desc)
    #この書き方だと結合したテーブル内で同名のカラムがあった際にエラーが起きる。対処法としては下記の書き方にするか、結合するテーブルにおいては同名のカラム名は避ける
    #@new_comment= Comment.where("created_at >= ?", Date.today).includes(:student).where(student: {situation_status: 3})
    # comments = Comment.includes(:student).where("created_at >= ?", Date.today)
    @today_comments = Comment.includes(:student).where(student: { situation_status: 'C' }).where("comments.created_at >= ?", Date.today)
    # @new_comments = comments.filter_map { |comment| comment.student.situation_status == 3}
    
    @today_subscriptions= Student.subscription_today
    
    @target= TargetNumber.where('start_day <= ?', Date.today).where('finish_day >= ?', Date.today)
    if @target.present?
      start_date= @target.start_day
      finish_date= @target.finish_day
      subscriptions_in_range= Student.where(subscription_day: start_date..finish_date)
      @subscription_count= subscriptions_in_range.count
      @target_count= @target.subscription_number
    end
  end
end
