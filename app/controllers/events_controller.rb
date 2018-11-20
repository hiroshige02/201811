class EventsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    x = Time.now
    a = x.year
    b = x.month
    @events = Event.where(year: a, month: b)

    from = Time.now.at_beginning_of_day
    to = (from + 6.day).at_end_of_day
    @events2 = Event.where(start_time: from..to)
    binding.pry
  end

  def next_month
    x = Time.now

    if j == 12
      c = x.year + 1
    else
      c = x.year
    end

    @events = Event.where(year: c, month: x.next_month.month)
    from = x.next_month.at_beginning_of_month
    to = (from + 6.day).at_end_of_day
    @events2 = Event.where(start_time: from..to)

  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    d =  Date.today.month
  end

  # def update
  #   respond_to do |format|
  #     if @event.update(event_params)
  #       format.html { redirect_to @event, notice: 'Event was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @event }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /events/1
  # DELETE /events/1.json
  # def destroy
  #   @event.destroy
  #   respond_to do |format|
  #     format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_time, :finish_time, :title, :regist_user_id, :content, :admin_ok, :admin_message, :admin_no, :participand, :event_image_id)
    end
end
