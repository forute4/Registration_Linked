class Admin::SubscriptionsController < ApplicationController
  def index
    @students= Student.all
    @trial_sutdents= Student.where(student_status: 1)
  end
end
