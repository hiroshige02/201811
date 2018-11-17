class RegistUsersController < ApplicationController
  def taikai
  end

  def index
  	@regist_users = RegistUser.all
  end

  def edit
  	@regist_user = current_regist_user
  end

  def show
  	@regist_user = RegistUser.find(params[:id])
    @events = Event.where(regist_user_id: @regist_user.id)
  end
end