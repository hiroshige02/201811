class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @admin = current_admin
    if @admin.update
      redirect_to admin_path(@admin.id)
    else
      render :edit
    end
     #成功後のリダイレクト先はapplication_controllerで設定
  end

  def show
    @events = Event.where(admin_ok: false, admin_no: false, finish: false).order(start_time: :desc)
    @eventsOK = Event.where(admin_ok: true, finish: false)
    eventsFinish = Event.order(finish_time: :desc)
    now = Time.now

    @past_events = []

    if eventsFinish != nil
      eventsFinish.each do |eventFinish|
        if eventFinish.finish_time < now
          @past_events << eventFinish
        end
      end
    end
    @past_events = @past_events.first(4)

  end

  def index
    @past_events = Event.where(admin_ok: true, finish: true).order(finish_time: :desc)
    to = Time.now
    from = (to - 1.month).at_end_of_day
    @past_events = Event.where(finish_time: from..to)
  end
end