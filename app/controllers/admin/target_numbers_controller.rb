class Admin::TargetNumbersController < ApplicationController

  def new
    @target= TargetNumber.new
  end

  def create
    @target= TargetNumber.new(target_params)
   if @target.save
     flash[:notice] ="目標が設定されました"
     redirect_to admin_target_number_path(@target.id)
   else
     flash[:alert] ="エラー "
     render :new
   end
  end

  def show
    @target= TargetNumber.find(params[:id])
    start_date= @target.start_day
    finish_date= @target.finish_day
    #申込された期間がstart_dayからfinish_dayの生徒
    subscriptions_in_range= Student.where(subscription_day: start_date..finish_date)
    @subscription_count= subscriptions_in_range.count
    #申込された期間がstart_dayからfinish_dayの生徒のうち内部生になった生徒
    continue_in_range=Student.where(subscription_day: start_date..finish_date).internal_student
    @continue_count= continue_in_range.count
  end

  def edit
    @target= TargetNumber.find(params[:id])
  end

  def update
    @target= TargetNumber.find(params[:id])
    @target.update(target_params)
    if @target.save
      flash[:notice] ="目標が変更されました"
      redirect_to admin_target_number_path(@target)
    else
      flash[:alert] ="エラー"
      render :edit
    end
  end

  def index
    @targets= TargetNumber.all
  end

  private

    def target_params
      params.require(:target_number).permit(:target_name, :start_day, :finish_day, :subscription_number, :continue_number)
    end

end
