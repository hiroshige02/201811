class RegistUser::PastEventsController < ApplicationController
  before_action :set_past_event, only: [:show, :edit, :update, :destroy]

  # GET /past_events
  # GET /past_events.json
  def index
    @past_events = PastEvent.all
  end

  # GET /past_events/1
  # GET /past_events/1.json
  def show
  end

  # GET /past_events/new
  def new
    @past_event = PastEvent.new
  end

  # GET /past_events/1/edit
  def edit
  end

  # POST /past_events
  # POST /past_events.json
  def create
    @past_event = PastEvent.new(past_event_params)

    respond_to do |format|
      if @past_event.save
        format.html { redirect_to @past_event, notice: 'Past event was successfully created.' }
        format.json { render :show, status: :created, location: @past_event }
      else
        format.html { render :new }
        format.json { render json: @past_event.errors, status: :unprocessable_entity }
      end
    end
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
    def past_event_params
      params.require(:past_event).permit(:past_start_time, :past_finish_time, :past_title, :past_content, :past_name, :past_user_mail_address, :past_participant, :past_event_image_id)
    end
end
