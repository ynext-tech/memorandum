class ShopsController < ApplicationController
  def index
    @shops = Shop.all.includes(:images).order('created_at desc')
    # @shop = Shop.includes(:images).order('created_at ASC')
    # @image = Image.all
  end

  def new
    @shop = Shop.new
    @shop.images.new
    @images = @shop.images.build
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    redirect_to root_path
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def destroy
    @shop = Shop.find(params[:id])
    if @shop.destroy
      redirect_to root_path
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.includes(:images).find(params[:id])
    if @shop.update(update_shop_params)
      render "show"
    else
      render "edit"
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:shop_name, :text, :address, :phone, :time, :price, :taberogu, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def update_shop_params
    params.require(:shop).permit(:shop_name, :text, :address, :phone, :time, :price, :taberogu, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
