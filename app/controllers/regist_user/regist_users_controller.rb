class RegistUser::RegistUsersController < ApplicationController
  before_action :authenticate_regist_user!

  def destroy

    @regist_user = RegistUser.find(params[:id])
    if @regist_user.events.update(regist_user_id: 1)
      @regist_user.destroy
      redirect_to root_path
    else
      render :taikai
    end
  end


end