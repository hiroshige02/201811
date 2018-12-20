class RegistUser::PastEventsController < ApplicationController
  before_action :set_past_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_regist_user!

  def index
    @past_events = Event.where(regist_user_id: current_regist_user.id, finish: true).order(start_time: :desc)
  end

  def show
    @past_event = PastEvent.find(params[:id])
  end

  def destroy
    @past_event.destroy
    respond_to do |format|
      format.html { redirect_to past_events_url, notice: 'Past event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
