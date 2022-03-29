class DpsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    # @dps = Dps.all
  end

  def new
    @dp = Dp.new
  end

  def create
    @dp = Dp.create(dp_params)
    redirect_to root_path
  end

  private

  def dp_params
    params.permit(:name, :product_number, :jan, :category, :content, :image).merge(user_id: current_user.id)
  end
end