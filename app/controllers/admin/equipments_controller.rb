class Admin::EquipmentsController < ApplicationController
  #before_action :authenticate_admin!

  def index
  	@equipments = Equipment.all
  	@dummy = Dummy.new
    @dummy.equipments.build
  end

  def create
  	dummy = Dummy.new(dummy_params)

    if dummy.save
      redirect_to admin_equipments_path
    else
      render :index
    end
  end

  private
  def dummy_params
    params.require(:dummy).permit(equipments_attributes: [:id, :equipment, :equipment_number, :_destroy])
  end
end
