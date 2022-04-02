class DishesController < ApplicationController
  before_action :require_user_logged_in 
  before_action :correct_dish, only: [:show, :edit, :update, :destroy]
  
  def index
    @dish = current_user.dishes.build
    @pagy, @dishes = pagy(current_user.dishes.order(id: :desc))
    
    @sum = 0
    current_user.dishes.each do |d|
      @sum += d.vegetables.to_i
    
    end
    @count = current_user.dishes.count
    
    if @count == 0
      @ave = 0
    else
    @ave = @sum/@count
    end
  end

  def show
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = current_user.dishes.build(dish_params)
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
  def correct_dish
    @dish = current_user.dishes.find_by(id: params[:id])
    redirect_to root_url unless @dish
  end
  def dish_params
    params.require(:dish).permit(:content, :vegetables)
  end
end
