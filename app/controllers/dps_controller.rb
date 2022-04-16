class DpsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :params_id, except: [:index, :new, :create, :search]  
  before_action :move_to_index, except: [:index,:new, :create, :show, :search]

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
  end

  def edit
  end

  def update
    if @dp.update(dp_params)
      redirect_to dp_path
    else
      render :edit
    end
  end

  def destroy
    @dp.destroy!
  end

  def search
    @dps = Dp.search(params[:keyword])
  end

  private

  def dp_params
    params.require(:dp).permit(:name, :product_number, :jan_code, :category_id, :image, :client, :source_id, :return_id, :confirm_date, :occurrence_date, :lotnumber, :summary).merge(user_id: current_user.id)
  end

  def params_id
    @dp = Dp.find(params[:id])
  end
  
  def move_to_index
    unless user_signed_in? && current_user.id == @dp.user_id
      redirect_to root_path
    end
  end
end