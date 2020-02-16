class PatronsController < ApplicationController
  before_action :set_clerk

  def show
    redirect_if_not_logged_in
    @patron = Patron.find(params[:id])
  end

  def destroy
    @patron = Patron.find(params[:id])
    @patron.destroy
    redirect_to clerk_orders_path(@clerk)
  end
end
