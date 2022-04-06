class DpsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @dps = Dp.all.order("created_at DESC")
  end

  def new
    @dp = Dp.new
  end

  def create
    @dp = Dp.new(dp_params)
    if @dp.save
      redirect_to root_path
    else
      # @dp = Dp.new(dp_params)
      render :new
    end
  end

  def show
    @dp = Dp.find(params[:id])
  end

  def edit
    @dp  = Dp.find(params[:id])
  end

  def update
    @dp = Dp.find(params[:id])
    if @dp.update(dp_params)
      redirect_to dp_path
    else
      render :edit
    end
  end

  def destroy
    @dp = Dp.find(params[:id])
    @dp.destroy!
  end

  def search
    @dps = Dp.search(params[:keyword])
  end

  private

  def dp_params
    params.require(:dp).permit(:name, :product_number, :jan_code, :category_id, :content, :image, :client, :source_id, :return_id, :confirm_date, :occurrence_date, :lotnumber).merge(user_id: current_user.id)
  end
end