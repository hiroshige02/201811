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
    @admin = Admin.find(1)

    events = Event.where(regist_user_id: @regist_user.id, admin_ok: false)
    events1 = Event.where(regist_user_id: @regist_user.id, admin_no: true)
    binding.pry
    @events = events + events1

    @eventsOK = Event.where(regist_user_id: @regist_user.id, admin_ok: true, admin_no: false)
  end

end