class PatronsController < ApplicationController
  before_action :set_clerk

  def show
    redirect_if_not_logged_in
    @patron = Patron.find(params[:id])
  end

  def edit
    @patron = Patron.find(params[:id])
  end

  def update
    @patron = Patron.find(params[:id])
      if @patron.update(patron_params)
          redirect_to patron_path(@patron)
      else
        @patron.valid?
          render :edit
      end
  end

  def destroy
    @patron = Patron.find(params[:patron_id])
    @patron.orders.destroy_all
    @patron.destroy
    redirect_to clerk_orders_path(@clerk)
  end

  private

  def patron_params
    params.require(:patron).permit(:name, :phone)
  end
  
end
