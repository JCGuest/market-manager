class PatronsController < ApplicationController
  before_action :set_clerk

  def show
    @patron = Patron.find(params[:id])
  end

  def destroy
    @patron = Patron.find(params[:id])
    @patron.destroy
    redirect_to clerk_orders_path(@clerk)
  end
end
