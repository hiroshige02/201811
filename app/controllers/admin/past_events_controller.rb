class Admin::PastEventsController < ApplicationController
  before_action :set_past_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def index
    @past_events = Event.where(admin_ok: true, finish: true).order(finish_time: :desc)
    @first_month = '2018-10-01 0:00:00 +0900'.to_time

  end

  def show
    @past_event =PastEvent.find(params[:id])
  end

  def edit
  end

  def create
    events = Event.where(admin_ok: true, admin_no: false, finish: false)
    now = Time.now
    a = Date.today
    events.each do |event|
      if event.finish_time < now
        event.update(finish: true)
      end
    end
    redirect_to admin_path(current_admin.id)
  end


  def update
    respond_to do |format|
      if @past_event.update(past_event_params)
        format.html { redirect_to @past_event, notice: 'Past event was successfully updated.' }
        format.json { render :show, status: :ok, location: @past_event }
      else
        format.html { render :edit }
        format.json { render json: @past_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @past_event.destroy
    respond_to do |format|
      format.html { redirect_to past_events_url, notice: 'Past event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
