class EventsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    x = Time.now
    a = x.year
    b = x.month
    @events = Event.where(year: a, month: b, admin_ok: true).order(start_time: :asc)

    from = Time.now.at_beginning_of_day
    to = (from + 6.day).at_end_of_day
    @events2 = Event.where(start_time: from..to, admin_ok: true)
  end

  def next_month
    x = Time.now

    if j == 12
      c = x.year + 1
    else
      c = x.year
    end

    @events = Event.where(year: c, month: x.next_month.month, admin_ok: true).order(start_time: :asc)
    from = x.next_month.at_beginning_of_month
    to = (from + 6.day).at_end_of_day
    @events2 = Event.where(start_time: from..to, admin_ok: true)

  end

  def show
    @event = Event.find(params[:id])
  end

  def top
    today = Time.now
    @events = Event.where(admin_ok: true).order(admin_ok_date: :desc).limit(3)
    @events2 = Event.where(year: today.year, month: today.month, admin_ok: true).order(start_time: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_time, :finish_time, :title, :regist_user_id, :content, :admin_ok, :admin_message, :admin_no, :participand, :event_image_id)
    end
end
