class DpsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @dps = Dp.all
  end

  def new
    @dp = Dp.new
  end

  def create
    @dp = Dp.new(dp_params)
    if @dp.valid?
      @dp.save
      redirect_to root_path
    else
      # @dp = Dp.new(dp_params)
      render :new
    end
  end

  private

  def dp_params
    params.require(:dp).permit(:name, :product_number, :jan, :category, :content, :image, :client).merge(user_id: current_user.id)
  end
end