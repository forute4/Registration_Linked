class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def search
    @students = Student.search(params[:keyword])
  end
  
  
end
