class Admin::EventsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /events
  # GET /events.json
  def index
    @events = Event.where(admin_ok: true, finish:false)
  end

  # GET /events/1
  # GET /events/1.json
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

  # GET /events/new
  def new
    @events = Event.where(admin_ok: true, finish: false).order(admin_ok_date: :desc).limit(5)
  end

  def edit
  end

  # def create
  #   @event = Event.new(event_params)

  #   respond_to do |format|
  #     if @event.save
  #       format.html { redirect_to @event, notice: 'Event was successfully created.' }
  #       format.json { render :show, status: :created, location: @event }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
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

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_time, :finish_time, :title, :regist_user_id, :content, :admin_ok, :admin_message, :admin_no, :participand, :event_image_id)
    end
end
