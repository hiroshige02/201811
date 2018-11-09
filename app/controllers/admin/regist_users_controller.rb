class Admin::RegistUsersController < ApplicationController
  
  def show
    @regist_user = RegistUser.find(params[:id])
  end

  def edit
    @regist_user = RegistUser.find(params[:id])
  end
  def index
    @regist_users = RegistUser.all
  end

  # def update
  #   @regist_user = current_regist_user
  #   if @regist_user.update(regist_user_params)
  #     redirect_to regist_user_path(current_regist_user.id)
  #     else
  #     	render:edit
  #   end
  end

