class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /meals
  # GET /meals.json
  def index
    @user = current_user.isAdmin
    @meals = Meal.all
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    if !current_user.isAdmin?
      puts "WORK?"
      redirect_to meals_path
    else
      @meal = Meal.new
    end
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    if !current_user.isAdmin?
      redirect_to meals_path
    else
      @meal = Meal.new(meal_params)

      respond_to do |format|
        if @meal.save
          format.html { redirect_to @meal, notice: 'Meal was successfully created.' }
          format.json { render :show, status: :created, location: @meal }
        else
          format.html { render :new }
          format.json { render json: @meal.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    if !current_user.isAdmin?
      redirect_to meals_path
    else
      respond_to do |format|
        if @meal.update(meal_params)
          format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
          format.json { render :show, status: :ok, location: @meal }
        else
          format.html { render :edit }
          format.json { render json: @meal.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:dish, :shop_id)
    end
end