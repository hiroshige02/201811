class RegistUsersController < ApplicationController
  before_action :authenticate_regist_user!
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



end