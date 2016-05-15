class ItemsController < ApplicationController

  def new
    @user = current_user
    @item = Item.new
  end

  def create
    if item_params.present?
      item_params[:name].downcase!
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
  end

  def destroy
    @user = current_user
    @item = @user.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item marked complete!"
    else
      flash[:alert] = "Item couldn't be marked complete. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
