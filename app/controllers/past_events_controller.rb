class PastEventsController < ApplicationController
  before_action :set_past_event, only: [:show, :edit, :update, :destroy]

  def index
     to = Time.now
     from = (to - 1.month).at_end_of_day
     @past_events = Event.where(finish_time: from..to, admin_ok: true, finish: true).order(finish_time: :desc)
  end

end
