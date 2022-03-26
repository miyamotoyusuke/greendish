class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  
  def index
   @pagy, @dishes = pagy(Dish.all, items: 10)
  end

  def show
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      flash[:success] = '食事の記録に成功しました'
      redirect_to @dish
    else
      flash.now[:danger] = '食事の記録に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @dish.update(dish_params)
      flash[:success] = '更新に成功しました'
      redirect_to @dish
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @dish.destroy
    
    flash[:success] = '記録が正常に削除されました'
    redirect_to dishes_url
  end
  
  private
  def set_dish
    @dish = Dish.find(params[:id])
  end
  def dish_params
    params.require(:dish).permit(:content, :vegetables)
  end
end
