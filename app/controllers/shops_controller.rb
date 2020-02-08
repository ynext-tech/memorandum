class ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @users = User.all
  end

  def new
  end

end
