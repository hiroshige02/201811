class AdminsController < ApplicationController
  before_action :authenticate_admin!

   def update
     @admin = current_admin
     if @admin.update
       redirect_to admin_path(@admin.id)
     else
       render :edit
     end
     #成功後のリダイレクト先はapplication_controllerで設定
   end

   def show
     @events = Event.where(admin_ok: false, admin_no: false, finish: false).order(start_time: :desc)
     @eventsOK = Event.where(admin_ok: true, finish: false)
     eventsFinish = Event.where(admin_ok: true, finish: true).order(finish_time: :desc)

     @past_events = []
     now = Time.now

     eventsFinish.each do |eventFinish|
       if eventFinish.finish_time < now
         @past_events << eventFinish
       end
    end

       @past_events = @past_events.first(4)

   end



   # private
   #   def admin_params
   #     params.require(:admin).permit(:admin_name, :admin_name_kana, :admin_tel_number)
   #   end

end
