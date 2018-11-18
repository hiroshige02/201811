class AdminsController < ApplicationController

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
     @events = Event.where(admin_ok: false, admin_no: false)
     @eventsOK = Event.where(admin_ok: true)
   end

   # private
   #   def admin_params
   #     params.require(:admin).permit(:admin_name, :admin_name_kana, :admin_tel_number)
   #   end

end
