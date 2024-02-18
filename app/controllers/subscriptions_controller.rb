class SubscriptionsController < ApplicationController
  def new
    @student= Student.new
  end

  def create
    @student= Student.new(student_params.merge(student_status: 1,situation_status: 1))
    @student.subscription_day= Date.today
    if@student.save
      redirect_to subscriptions_thanks_path
    else
      render :new
    end
  end

  def thanks
  end

  private
    def student_params
      params.require(:student).permit(:last_name, :first_name, :last_name_kana,
                     :first_name_kana, :address, :email, :post_code, :school_name, :grade,
                     :telephone_number, :student_status, :situation_status)
    end
end
