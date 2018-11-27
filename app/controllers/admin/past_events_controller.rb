class Admin::PastEventsController < ApplicationController
  before_action :set_past_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /past_events
  # GET /past_events.json

  def index
    @past_events = Event.where(admin_ok: true, finish: true).order(finish_time: :desc)
    @first_month = '2018-10-01 0:00:00 +0900'.to_time

  end

  def show
    @past_event =PastEvent.find(params[:id])
  end

  def edit
  end

  # POST /past_events
  # POST /past_events.json
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

  # PATCH/PUT /past_events/1
  # PATCH/PUT /past_events/1.json
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

  # DELETE /past_events/1
  # DELETE /past_events/1.json
  def destroy
    @past_event.destroy
    respond_to do |format|
      format.html { redirect_to past_events_url, notice: 'Past event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_past_event
      @past_event = PastEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def past_event_params
    #   params.require(:past_event).permit(:past_start_time, :past_finish_time, :past_title, :past_content, :past_name, :past_user_mail_address, :past_participant, :past_event_image_id)
    # end
end
