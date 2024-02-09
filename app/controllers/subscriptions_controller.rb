class SubscriptionsController < ApplicationController
  def new
    @student= Student.new
  end

  def create
    @student= Student.new(student_params)
    @student.subscription_day= Date.today
    @student.save
    redirect_to subscriptions_thanks_path
  end

  def thanks
  end

  private
    def student_params
      params.require(:student).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :email, :post_code, :school_name, :grade )
    end
end
