class SubscriptionsController < ApplicationController
  
  def top
  end
  
  def new
    @student= Student.new
  end

  def create
    @student= Student.new(student_params.merge(student_status: 'trial_student',situation_status: 'A'))
    @student.subscription_day= Date.today
    if@student.save
      redirect_to subscriptions_thanks_path
    else
      redirect_to new_subscription
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
