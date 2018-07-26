class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /meals
  # GET /meals.json
  def index
    @users = current_user.isAdmin
    @meals = Meal.all
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    @users = current_user.isAdmin
    if !current_user.isAdmin?
      redirect_to meals_path
    else
      @meals = Meal.new
    end
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @users = current_user.isAdmin
    if !current_user.isAdmin?
      redirect_to meals_path
    else
    @meals = Meal.new(meal_params)

    respond_to do |format|
      if @meals.save
        format.html { redirect_to @meals, notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meals }
      else
        format.html { render :new }
        format.json { render json: @meals.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    @users = current_user.isAdmin
    if !current_user.isAdmin?
      redirect_to meals_path
    else
    respond_to do |format|
      if @meals.update(meal_params)
        format.html { redirect_to @meals, notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meals }
      else
        format.html { render :edit }
        format.json { render json: @meals.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @users = current_user.isAdmin
    if !current_user.isAdmin?
      redirect_to meals_path
    else
    @meals.destroy
    respond_to do |format|
      format.html { redirect_to meals_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meals = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:dish, :shop_id)
    end
end
