class Admin::HomesController < ApplicationController
  def top
    #生徒ステータスCの生徒の今日投稿されとコメント
    @today_comments = Comment.includes(:student).where(student: { situation_status: 'C' }).where("comments.created_at >= ?", Date.today)
    #今日投稿された申込の情報
    @today_subscriptions= Student.subscription_today
    #設定された目標数値の中で今日を含むもののレコード
    @target= TargetNumber.where('start_day <= ?', Date.today).where('finish_day >= ?', Date.today)&.last
    if @target.present?
      start_date= @target.start_day
      finish_date= @target.finish_day
      #目標数値で設定した区間に投稿された申込の情報
      subscriptions_in_range= Student.where(subscription_day: start_date..finish_date)
      @subscription_count= subscriptions_in_range.count
    end
  end
end
