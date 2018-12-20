class Admin::EventsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def index
    @events = Event.where(admin_ok: true, finish:false)
  end

  def show
    @event = Event.find(params[:id])
  end

  def check
    @event = Event.find(params[:id])
  end

  def approve
    @event = Event.find(params[:id])
    if params[:sayno] == nil
      a = Date.today
      @event.update(admin_ok: true, admin_message: params[:event][:admin_message], admin_ok_date: a)
    else
      @event.update(admin_no: true, admin_message: params[:event][:admin_message])
    end
    redirect_to admin_path(current_admin.id)
  end


  def new
    @events = Event.where(admin_ok: true, finish: false).order(admin_ok_date: :desc).limit(5)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_path(current_admin.id)
  end

  private

    def event_params
      params.require(:event).permit(:start_time, :finish_time, :title, :regist_user_id, :content, :admin_ok, :admin_message, :admin_no, :participant, :event_image_id)
    end
  end
