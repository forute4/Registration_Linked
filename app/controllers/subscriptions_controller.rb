class SubscriptionsController < ApplicationController
  def new
    @student= MakeStudentForm.new
  end

  def create
    @student= MakeStudentForm.new(student_params.merge(student_status: 1,situation_status: 1))
    @student.subscription_day= Date.today
    @student.save
    redirect_to subscriptions_thanks_path
  end

  def thanks
  end

  private
    def student_params
      params.require(:make_student_form).permit(:last_name, :first_name, :last_name_kana,
                     :first_name_kana, :address, :email, :post_code, :school_name, :grade,
                     :number, :student_status, :situation_status)
    end
end
