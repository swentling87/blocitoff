class ItemsController < ApplicationController

  def new
    @user = current_user
    @item = Item.new
  end

  def create
    @user = current_user
    @item = @user.items.build(item_params)
    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "There was an error saving the item. Please try again."
      render :back
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
