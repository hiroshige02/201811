class Admin::EquipmentEventsController < ApplicationController
  before_action :set_equipment_event, only: [:show, :edit, :update, :destroy]

  # GET /equipment_events
  # GET /equipment_events.json
  def index
    @equipment_events = EquipmentEvent.all
  end

  # GET /equipment_events/1
  # GET /equipment_events/1.json
  def show
  end

  # GET /equipment_events/new
  def new
    @equipment_event = EquipmentEvent.new
  end

  # GET /equipment_events/1/edit
  def edit
  end

  # POST /equipment_events
  # POST /equipment_events.json
  def create
    @equipment_event = EquipmentEvent.new(equipment_event_params)

    respond_to do |format|
      if @equipment_event.save
        format.html { redirect_to @equipment_event, notice: 'Equipment event was successfully created.' }
        format.json { render :show, status: :created, location: @equipment_event }
      else
        format.html { render :new }
        format.json { render json: @equipment_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_events/1
  # PATCH/PUT /equipment_events/1.json
  def update
    respond_to do |format|
      if @equipment_event.update(equipment_event_params)
        format.html { redirect_to @equipment_event, notice: 'Equipment event was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment_event }
      else
        format.html { render :edit }
        format.json { render json: @equipment_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_events/1
  # DELETE /equipment_events/1.json
  def destroy
    @equipment_event.destroy
    respond_to do |format|
      format.html { redirect_to equipment_events_url, notice: 'Equipment event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_event
      @equipment_event = EquipmentEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_event_params
      params.require(:equipment_event).permit(:event_id, :equipment_id)
    end
end
