class ItemsController < ApplicationController

  def take
    unless adventure.take_item(params[:item])
      flash[:error] = "You cannot take that item."
    end
    redirect_to adventure_path
  end

end