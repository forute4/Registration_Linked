class Admin::SearchesController < ApplicationController

  def search
    @students = Student.search(params[:keyword])
  end
  
  
end
