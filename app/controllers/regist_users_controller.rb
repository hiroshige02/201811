class RegistUsersController < ApplicationController
  def taikai
  end

  def index
  	@regist_users = RegistUser.all
  end

  def show
  	@regist_user = RegistUser.find(params[:id])
  end
end