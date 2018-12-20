class Admin::RegistUsersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @regist_user = RegistUser.find(params[:id])
    eventsFinish = Event.where(regist_user_id: @regist_user.id).order(finish_time: :desc)
    now = Time.now

    @past_events = []

    if eventsFinish != nil
      eventsFinish.each do |eventFinish|
        if eventFinish.finish_time < now
          @past_events << eventFinish
        end
      end
      @past_events = @past_events.first(4)
    end

    @events = Event.where(regist_user_id: @regist_user.id, admin_ok: false, admin_no: false).order(start_time: :desc)
    @eventsno = Event.where(regist_user_id: @regist_user.id, admin_no: true).order(start_time: :desc)
    @eventsOK = Event.where(regist_user_id: @regist_user.id, admin_ok: true, admin_no: false, finish: false)
  end

  def edit
    @regist_user = RegistUser.find(params[:id])
  end

  def index
    @regist_users = RegistUser.page(params[:page]).reverse_order
  end

  def destroy
    regist_user = RegistUser.find(params[:id])
    if regist_user.events.update(regist_user_id: 1)
       regist_user.destroy
       redirect_to admin_regist_users_path
    else
      render:edit
    end
  end

  def update
    regist_user = RegistUser.find(params[:id])
    if regist_user.update(regist_user_params)
      redirect_to admin_regist_user_path(regist_user.id)
    else
    	render:edit
    end
  end

  def regist_user_params
    params.require(:regist_user).permit(:regist_name, :regist_name_kana, :birthday, :regist_tel_number, :job, :profile_image)
  end
end

