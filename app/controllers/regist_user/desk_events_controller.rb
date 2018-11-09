class RegistUser::DeskEventsController < ApplicationController
  before_action :set_desk_event, only: [:show, :edit, :update, :destroy]

  # GET /desk_events
  # GET /desk_events.json
  def index
    @desk_events = DeskEvent.all
  end

  # GET /desk_events/1
  # GET /desk_events/1.json
  def show
  end

  # GET /desk_events/new
  def new
    @desk_event = DeskEvent.new
  end

  # GET /desk_events/1/edit
  def edit
  end

  # POST /desk_events
  # POST /desk_events.json
  def create
    @desk_event = DeskEvent.new(desk_event_params)

    respond_to do |format|
      if @desk_event.save
        format.html { redirect_to @desk_event, notice: 'Desk event was successfully created.' }
        format.json { render :show, status: :created, location: @desk_event }
      else
        format.html { render :new }
        format.json { render json: @desk_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desk_events/1
  # PATCH/PUT /desk_events/1.json
  def update
    respond_to do |format|
      if @desk_event.update(desk_event_params)
        format.html { redirect_to @desk_event, notice: 'Desk event was successfully updated.' }
        format.json { render :show, status: :ok, location: @desk_event }
      else
        format.html { render :edit }
        format.json { render json: @desk_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desk_events/1
  # DELETE /desk_events/1.json
  def destroy
    @desk_event.destroy
    respond_to do |format|
      format.html { redirect_to desk_events_url, notice: 'Desk event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desk_event
      @desk_event = DeskEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def desk_event_params
      params.require(:desk_event).permit(:event_id, :desk_id)
    end
end
